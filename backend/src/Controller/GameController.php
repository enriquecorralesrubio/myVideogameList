<?php

namespace App\Controller;

use App\Entity\Game;
use App\Entity\GameGenre;
use App\Entity\GamePlatform;
use App\Entity\Genre;
use App\Entity\Platform;
use App\Repository\GameRepository;
use App\Repository\GenreRepository;
use App\Repository\PlatformRepository;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bridge\Doctrine\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;


class GameController extends AbstractController



{
    private $gameRepository;
    private $entityManager;

    public function __construct(GameRepository $gameRepository, EntityManagerInterface $entityManager)
    {
        $this->gameRepository = $gameRepository;
        $this->entityManager = $entityManager;
    }

    #[Route('/api/games', name: 'app_games', methods: ['GET'])]
    public function index( JWTTokenManagerInterface $jwtManager, Request $request, AuthController $authController): JsonResponse
    {
        $user = $authController->extractAndValidateToken($request, $jwtManager);

        if(!$user){
            return new JsonResponse(['error' => 'Usuario no encontrado'], 404);
        }


        $games = $this->gameRepository->findAll();


        $data = [];
        foreach ($games as $game) {
            $game->updateGlobalRating();
            $platforms = [];
            foreach ($game->getGamePlatforms() as $gamePlatform) {
                $platform = $gamePlatform->getPlatform();
                $platforms[] = [
                    'uuid' => $platform->getUuid(),
                    'name' => $platform->getName(),
                ];
            }

            $genres = [];
            foreach ($game->getGameGenres() as $gameGenre) {
                $genre = $gameGenre->getGenre();
                $genres[] = [
                    'uuid' => $genre->getUuid(),
                    'name' => $genre->getName(),
                ];
            }

            $gameUser = $user->getGameUsers();
            $gameFound = false;

            if (!empty($gameUser)) {
                foreach ($gameUser as $userGame) {
                    if ($userGame->getGame() === $game) {
                        $gameFound = true;
                    }
                }
            }

            $data[] = [
                'uuid' => $game->getUuid(),
                'title' => $game->getName(),
                'developer' => $game->getDeveloper(),
                'globalRating' => $game->getGlobalRating(),
                'cover' => $game->getCover(),
                'platforms' => $platforms,
                'genres' => $genres,
                'gameFound' => $gameFound
            ];
        }

        return new JsonResponse($data);
    }


    #[Route('/api/game-detail/{uuid}', name: 'app_game_details', methods: ['GET'])]
    public function gameDetails(string $uuid, JWTTokenManagerInterface $jwtManager, Request $request, AuthController $authController): JsonResponse
    {

        $user = $authController->extractAndValidateToken($request, $jwtManager);

        if(!$user){
            return new JsonResponse(['error' => 'Usuario no encontrado'], 404);
        }

        $game = $this->gameRepository->findOneBy(['uuid' => $uuid]);

        if (!$game) {
            return new JsonResponse(['error' => 'Juego no encontrado'], 404);
        }

        $game->updateGlobalRating();

        $platforms = [];
        foreach ($game->getGamePlatforms() as $gamePlatform) {
            $platform = $gamePlatform->getPlatform();
            $platforms[] = [
                'uuid' => $platform->getUuid(),
                'name' => $platform->getName(),
            ];
        }

        $genres = [];
        foreach ($game->getGameGenres() as $gameGenre) {
            $genre = $gameGenre->getGenre();
            $genres[] = [
                'uuid' => $genre->getUuid(),
                'name' => $genre->getName(),
            ];
        }

        $data = [
            'uuid' => $game->getUuid(),
            'title' => $game->getName(),
            'developer' => $game->getDeveloper(),
            'globalRating' => $game->getGlobalRating(),
            'cover' => $game->getCover(),
            'synopsis' => $game->getSynopsis(),
            'platforms' => $platforms,
            'genres' => $genres
        ];

        return new JsonResponse($data);
    }

    //Métodos del admin

    #[Route('/admin/game/remove/{uuid}', name: 'remove_game', methods: ['DELETE'])]
    public function removeGame(Request $request, JWTTokenManagerInterface $jwtManager, string $uuid, AuthController $authController )
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if(!$admin){
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $game = $this->gameRepository->findOneBy(['uuid' => $uuid]);


        if (!$game) {
            return new JsonResponse(['error' => 'Juego no encontrado'], 404);
        }

        try {

            $this->entityManager->remove($game);
            $this->entityManager->flush();
            return new JsonResponse(['message' => 'Juego eliminado correctamente de la base de datos'], 200);

        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Error al eliminar el juego de la BD'], 500);
        }
    }

    #[Route('/admin/game/add', name: 'add_game')]
    public function addGame(GameRepository $gameRepository, GenreRepository $genreRepository, PlatformRepository $platformRepository, Request $request, JWTTokenManagerInterface $jwtManager, AuthController $authController )
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $data = json_decode($request->getContent(), true);

        $existingGame = $gameRepository->findOneBy(['name' => $data['title']]);
        if ($existingGame) {
            return new JsonResponse(['error' => 'El juego ya existe'], 400);
        }

        if (!isset($data['title'], $data['developer'], $data['cover'])) {
            return new JsonResponse(['error' => 'Datos incompletos'], 400);
        }
        $game = new Game();
        $game->setName($data['title']);
        $game->setDeveloper($data['developer']);
        $game->setCover($data['cover']);
        $game->setSynopsis($data['synopsis']);

        $this->entityManager->persist($game);
        $this->entityManager->flush();

        // Asociar los géneros seleccionados con el juego
        if (isset($data['genres'])) {
            foreach ($data['genres'] as $genreUuid) {
                $gameGenre = new GameGenre();
                $gameGenre->setGame($game);
                $genre = $this->entityManager->getRepository(Genre::class)->findOneBy(['uuid' => $genreUuid]);
                if ($genre) {
                    $gameGenre->setGenre($genre);
                    $this->entityManager->persist($gameGenre);
                }
            }
        }

        // Asociar las plataformas seleccionadas con el juego
        if (isset($data['platforms'])) {
            foreach ($data['platforms'] as $platformUuid) {
                $gamePlatform = new GamePlatform();
                $gamePlatform->setGame($game);
                $platform = $this->entityManager->getRepository(Platform::class)->findOneBy(['uuid' => $platformUuid]);
                if ($platform) {
                    $gamePlatform->setPlatform($platform);
                    $this->entityManager->persist($gamePlatform);
                }
            }
        }



        $this->entityManager->flush();

        return new JsonResponse(['success' => 'Juego agregado correctamente'], 201);
    }


    #[Route('/admin/edit-game', name: 'admin_edit_game', methods: ['PUT'])]
    public function adminEditGame(Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, ValidatorInterface $validator) {

        $user = $authController->extractAndValidateToken($request, $jwtManager);
        $data = json_decode($request->getContent(), true);

        $game = $this->entityManager->getRepository(Game::class)->findOneBy([
            'uuid' => $data['uuid']
        ]);

        if (!$game) {
            return new JsonResponse(['error' => 'Juego no encontrado'], 404);
        }

        try {

            $game->setName($data['title']);
            $game->setCover($data['cover']);
            $game->setDeveloper($data['developer']);
            $game->setSynopsis($data['synopsis']);

            $errors = $validator->validate($game);

            if (count($errors) > 0) {
                $errorMessages = [];
                foreach ($errors as $error) {
                    $errorMessages[] = $error->getMessage();
                }
                return $this->json(['errors' => $errorMessages], 400);
            }
            $existingGenres = $game->getGameGenres();
            $existingPlatforms = $game->getGamePlatforms();

            // Actualizar las asociaciones de géneros del juego
            if (isset($data['genres'])) {
                foreach ($data['genres'] as $genreUuid) {
                    $genre = $this->entityManager->getRepository(Genre::class)->findOneBy(['uuid' => $genreUuid]);
                    if ($genre && !$game->hasGenre($genre)) {
                        $gameGenre = new GameGenre();
                        $gameGenre->setGame($game);
                        $gameGenre->setGenre($genre);
                        $this->entityManager->persist($gameGenre);
                    }
                }
                foreach ($existingGenres as $existingGenre) {
                    if (!in_array($existingGenre->getGenre()->getUuid(), $data['genres'])) {
                        $this->entityManager->remove($existingGenre);
                    }
                }
            }

            // Actualizar las asociaciones de plataformas del juego
            if (isset($data['platforms'])) {
                foreach ($data['platforms'] as $platformUuid) {
                    $platform = $this->entityManager->getRepository(Platform::class)->findOneBy(['uuid' => $platformUuid]);
                    if ($platform && !$game->hasPlatform($platform)) {
                        $gamePlatform = new GamePlatform();
                        $gamePlatform->setGame($game);
                        $gamePlatform->setPlatform($platform);
                        $this->entityManager->persist($gamePlatform);
                    }
                }
                foreach ($existingPlatforms as $existingPlatform) {
                    if (!in_array($existingPlatform->getPlatform()->getUuid(), $data['platforms'])) {
                        $this->entityManager->remove($existingPlatform);
                    }
                }
            }
            $this->entityManager->flush();

            return $this->json(['message' => 'Juego editado correctamente'], 200);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Error al editar el juego'], 500);
        }
    }

}
