<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\Persistence\ManagerRegistry;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\HttpFoundation\Response;




class UserController extends AbstractController
{

    public function __construct(JWTTokenManagerInterface $jwtManager, ManagerRegistry $doctrine)
    {
        $this->jwtManager = $jwtManager;
        $this->doctrine = $doctrine;
    }

    #[Route('/api/user/index', name: 'app_index')]
    public function index(Request $request): JsonResponse
    {
        $username = $this->getUsernameFromToken($request);
        if (!$username) {
            return new JsonResponse(['error' => 'Usuario no autenticado'], 401);
        }

        $userRole = $this->getUserRole($username);

        $isAdmin = in_array('ROLE_ADMIN', $userRole);
        $isUser = in_array('ROLE_USER', $userRole);

        if ($isAdmin) {
            return new JsonResponse(['redirectTo' => '/admin/home']);
        } elseif ($isUser) {
            return new JsonResponse(['redirectTo' => '/home']);
        } else {

            return new JsonResponse(['error' => 'Rol de usuario desconocido'], 401);
        }

    }

    private function getUsernameFromToken(Request $request)
    {
        $authHeader = $request->headers->get('Authorization');

        if (!$authHeader) {
            throw new \Exception('Token de autenticación no proporcionado', 401);
        }

        $token = str_replace('Bearer', '', $authHeader);

        try {

            $tokenParts = explode('.', $token);
            $tokenPayload = base64_decode($tokenParts[1]);
            $payloadData = json_decode($tokenPayload, true);


            return $payloadData['username'] ?? null;
        } catch (\Exception $e) {

            throw new \Exception('Token de autenticación inválido', 401);
        }
    }

    private function getUserRole($username)
    {

        $user = $this->doctrine->getRepository(User::class)->findOneBy(['username' => $username]);


        if (!$user || !$user->getRoles()) {
            throw new \Exception('Rol de usuario desconocido');
        }

        return $user->getRoles();
    }


    /*#[Route('/user/create-admin', name: 'create_admin')]
    public function createAdmin( ManagerRegistry $doctrine, UserPasswordHasherInterface $passwordHasher): Response
    {

        $user = new User();

        $user->setEmail('admin@admin.com');
        $user->setUsername('admin');
        $user->setRoles(['ROLE_ADMIN']);


        $plainPassword = 'password';
        $hashedPassword = $passwordHasher->hashPassword($user, $plainPassword);
        $user->setPassword($hashedPassword);


        $entityManager = $doctrine->getManager();
        $entityManager->persist($user);
        $entityManager->flush();

        return new Response('Usuario administrador creado correctamente.');
    }*/

}
