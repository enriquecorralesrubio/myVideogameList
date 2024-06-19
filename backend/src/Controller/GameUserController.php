<?php

namespace App\Controller;

use App\Entity\Game;
use App\Entity\GameUser;
use App\Repository\GameRepository;
use App\Repository\GameUserRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class GameUserController extends AbstractController
{
    private $userRepository;
    private $gameRepository;
    private $entityManager;

    public function __construct(GameUserRepository $gameUserRepository, UserRepository $userRepository, TokenStorageInterface $tokenStorage, GameRepository $gameRepository, EntityManagerInterface $entityManager)
    {
        $this->gameUserRepository = $gameUserRepository;
        $this->userRepository = $userRepository;
        $this->tokenStorage = $tokenStorage;
        $this->gameRepository = $gameRepository;
        $this->entityManager = $entityManager;

    }

    #[Route('/api/game-user/game-list', name: 'show_user_list')]
    public function index(Request $request, JWTTokenManagerInterface $jwtManager, AuthController $authController)
    {
        $user = $authController->extractAndValidateToken($request, $jwtManager);

        try {
            $gameUsers = $user->getGameUsers();

            $games = [];
            foreach ($gameUsers as $gameUser) {
                $game = $gameUser->getGame();
                $games[] = [
                    'userUuid' => $gameUser->getUser()->getUuid(),
                    'gameUuid' => $game->getUuid(),
                    'gameName' => $game->getName(),
                    'cover' => $game->getCover(),
                    'userRating' => $gameUser->getUserRating(),
                    'timePlayed' => $gameUser->getTimePlayed(),
                    'state' => $gameUser->getState(),
                ];
            }

            return new JsonResponse($games);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Error al obtener la lista de juegos'], 500);
        }
    }

    #[Route('/api/game-user/getGameUser/{userUuid}/{gameUuid}', name: 'get_game_user', methods: ['GET'])]
    public function getGameUser(string $userUuid, string $gameUuid, Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager){
        $user = $authController->extractAndValidateToken($request, $jwtManager);

        if(!$user){
            return new JsonResponse(['error' => 'Usuario no encontrado'], 404);
        }


        $userEntity = $this->userRepository->findOneBy(['uuid' => $userUuid]);

        if (!$userEntity) {
            return new JsonResponse(['error' => 'Usuario no encontrado'], 404);
        }

        $gameEntity = $this->gameRepository->findOneBy(['uuid' => $gameUuid]);

        if (!$gameEntity) {
            return new JsonResponse(['error' => 'Juego no encontrado'], 404);
        }

        $gameUser = $this->entityManager->getRepository(GameUser::class)->findOneBy([
            'user' => $userEntity,
            'game' => $gameEntity
        ]);

        if (!$gameUser) {
            return new JsonResponse(['error' => 'Relación Usuario-Juego no encontrada'], 404);
        }

        $data = [
            'userUuid' => $userEntity->getUuid(),
            'gameUuid' => $gameEntity->getUuid(),
            'userRating' => $gameUser->getUserRating(),
            'timePlayed' => $gameUser->getTimePlayed(),
            'state' => $gameUser->getState(),
            'gameName' => $gameEntity->getName(),
            'cover' => $gameEntity->getCover()
        ];

        return new JsonResponse($data);
    }

    #[Route('/api/game-user/remove/{gameUuid}', name: 'remove_game_from_user', methods: ['DELETE'])]
    public function removeGameFromUserList(Request $request, JWTTokenManagerInterface $jwtManager, string $gameUuid, AuthController $authController )
    {
        $user = $authController->extractAndValidateToken($request, $jwtManager);


        $userUuid = $user->getUuid();

        $gameUser = $this->entityManager->getRepository(GameUser::class)->findOneBy([
            'user' => $userUuid,
            'game' => $gameUuid
        ]);


        if (!$gameUser) {
            return new JsonResponse(['error' => 'El juego no está en la lista del usuario'], 404);
        }

        try {

            $this->entityManager->remove($gameUser);
            $this->entityManager->flush();
            return new JsonResponse(['message' => 'Juego eliminado correctamente de la lista del usuario'], 200);

        } catch (\Exception $e) {
                return new JsonResponse(['error' => 'Error al eliminar el juego de la lista del usuario'], 500);
            }
    }



    #[Route('/api/game-user/add-game', name: 'add_game_from_user', methods: ['POST'])]
    public function addGame(Request $request, AuthController $authController,  JWTTokenManagerInterface $jwtManager, ManagerRegistry $doctrine, ValidatorInterface $validator) {

        $user = $authController->extractAndValidateToken($request, $jwtManager);
        $data = json_decode($request->getContent(), true);
        $game = $this->entityManager->getRepository(Game::class)->findOneBy([
            'uuid' => $data['uuid']
        ]);

        try {
            $gameUser = new GameUser();
            $gameUser->setUser($user);
            $gameUser->setGame($game);
            $gameUser->setUserRating($data['userRating']);
            $gameUser->setTimePlayed($data['timePlayed']);
            $gameUser->setState($data['state']);


            $errors = $validator->validate($gameUser);

            if (count($errors) > 0) {
                $errorMessages = [];
                foreach ($errors as $error) {
                    $errorMessages[] = $error->getMessage();
                }
                return $this->json(['errors' => $errorMessages], 400);
            }

            $entityManager = $doctrine->getManager();
            $entityManager->persist($gameUser);
            $entityManager->flush();

            //Para actualizar la nota media
            $game->updateGlobalRating();
            $entityManager->persist($game);
            $entityManager->flush();

            return $this->json(['message' => 'Juego agregado correctamente'], 200);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Error al agregar el juego a la lista'], 500);
        }
    }

    #[Route('/api/game-user/edit-game', name: 'edit_game', methods: ['PUT'])]
    public function editGame(Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, ManagerRegistry $doctrine, ValidatorInterface $validator) {

        $user = $authController->extractAndValidateToken($request, $jwtManager);
        $data = json_decode($request->getContent(), true);



        $game = $this->entityManager->getRepository(Game::class)->findOneBy([
            'uuid' => $data['gameUuid']
        ]);

        if (!$game) {
            return new JsonResponse(['error' => 'Juego no encontrado'], 404);
        }

        $gameUser = $this->entityManager->getRepository(GameUser::class)->findOneBy([
            'user' => $user,
            'game' => $game
        ]);

        if (!$gameUser) {
            return new JsonResponse(['error' => 'Registro de juego para el usuario no encontrado'], 404);
        }

        try {
            $gameUser->setUserRating($data['userRating']);
            $gameUser->setTimePlayed($data['timePlayed']);
            $gameUser->setState($data['state']);


            $errors = $validator->validate($gameUser);

            if (count($errors) > 0) {
                $errorMessages = [];
                foreach ($errors as $error) {
                    $errorMessages[] = $error->getMessage();
                }
                return $this->json(['errors' => $errorMessages], 400);
            }

            $entityManager = $doctrine->getManager();
            $entityManager->flush();

            //Para actualizar la nota media
            $game->updateGlobalRating();
            $entityManager->persist($game);
            $entityManager->flush();

            return $this->json(['message' => 'Juego editado correctamente'], 200);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Error al editar el juego en la lista'], 500);
        }
    }
}
