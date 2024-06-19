<?php

namespace App\Controller;

use App\Entity\Platform;
use App\Repository\PlatformRepository;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class PlatformController extends AbstractController
{
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/api/platforms', name: 'get_platforms', methods: ['GET'])]
    public function getPlatforms(Request $request, JWTTokenManagerInterface $jwtManager, AuthController $authController, PlatformRepository $platformRepository )
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $platforms = $platformRepository->findAll();
        $platformsArray = [];

        foreach ($platforms as $platform) {
            $platformsArray[] = [
                'uuid' => $platform->getUuid(),
                'name' => $platform->getName(),
            ];
        }

        return new JsonResponse($platformsArray);
    }


    #[Route('/api/add-platform', name: 'add_platform', methods: ['POST'])]
    public function addPlatform(Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, PlatformRepository $platformRepository)
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }


        $data = json_decode($request->getContent(), true);

        $existingPlatform = $platformRepository->findOneBy(['name' => $data['name']]);
        if ($existingPlatform) {
            return new JsonResponse(['error' => 'La plataforma ya existe'], 400);
        }

        $platform = new Platform();


        $platform->setName($data['name']);


        $this->entityManager->persist($platform);
        $this->entityManager->flush();

        return new JsonResponse("Plataforma agregada con éxito");
    }

    #[Route('/api/delete-platform/{uuid}', name: 'delete_platform', methods: ['DELETE'])]
    public function deletePlatform(string $uuid, Request $request, AuthController $authController, JWTTokenManagerInterface $jwtManager, PlatformRepository $platformRepository)
    {
        $admin = $authController->extractAndValidateToken($request, $jwtManager);

        if (!$admin) {
            return new JsonResponse(['error' => 'Admin no encontrado'], 404);
        }

        $platform = $platformRepository->findOneBy(['uuid' => $uuid]);

        if (!$platform) {
            return new JsonResponse(['error' => 'Plataforma no encontrada'], 404);
        }

        $this->entityManager->remove($platform);
        $this->entityManager->flush();

        return new JsonResponse("Plataforma eliminada con éxito");
    }
}
