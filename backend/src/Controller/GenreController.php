<?php

namespace App\Controller;

use App\Entity\Genre;
use App\Repository\GenreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class GenreController extends AbstractController
{

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/api/genres', name: 'get_genres', methods: ['GET'])]
    public function getGenres(Request $request, JWTTokenManagerInterface $jwtManager, AuthController $authController, GenreRepository $genreRepository )
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $genres = $genreRepository->findAll();
        $genresArray = [];

        foreach ($genres as $genre) {
            $genresArray[] = [
                'uuid' => $genre->getUuid(),
                'name' => $genre->getName(),
            ];
        }

        return new JsonResponse($genresArray);
    }

    #[Route('/api/add-genre', name: 'add_genre', methods: ['POST'])]
    public function addPlatform(Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, GenreRepository $genreRepository)
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }


        $data = json_decode($request->getContent(), true);

        $existingGenre = $genreRepository->findOneBy(['name' => $data['name']]);
        if ($existingGenre) {
            return new JsonResponse(['error' => 'El género ya existe'], 400);
        }

        $genre = new Genre();


        $genre->setName($data['name']);


        $this->entityManager->persist($genre);
        $this->entityManager->flush();

        return new JsonResponse("Género agregado con éxito");
    }

    #[Route('/api/delete-genre/{uuid}', name: 'delete_genre', methods: ['DELETE'])]
    public function deleteGenre(string $uuid, Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, GenreRepository $genreRepository)
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $genre = $genreRepository->findOneBy(['uuid' => $uuid]);

        if (!$genre) {
            return new JsonResponse(['error' => 'Género no encontrado'], 404);
        }

        $this->entityManager->remove($genre);
        $this->entityManager->flush();

        return new JsonResponse("Género eliminado con éxito");
    }
}
