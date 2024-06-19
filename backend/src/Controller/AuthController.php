<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Lexik\Bundle\JWTAuthenticationBundle\Encoder\JWTEncoderInterface;
use Lexik\Bundle\JWTAuthenticationBundle\TokenExtractor\AuthorizationHeaderTokenExtractor;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints\Json;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Http\Event\InteractiveLoginEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTManager;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\JWTDecodeFailureException;


class AuthController extends AbstractController

{
    private $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;

    }

    #[Route('/auth/register', name: 'auth_register')]
    public function register(Request $request, UserPasswordHasherInterface $passwordHasher, ManagerRegistry $doctrine, JWTTokenManagerInterface $jwtManager)
    {
        $data = json_decode($request->getContent(), true);
        $email = $data['email'] ?? null;
        $password = $data['password'] ?? null;
        $username = $data['username'] ?? null;

        if (!$email || !$password || !$username) {
            return new JsonResponse(['error' => 'Datos incompletos'], 400);
        }

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return new JsonResponse(['error' => 'El correo electrónico no es válido'], 400);
        }

        $existingUserEmail = $doctrine->getRepository(User::class)->findOneBy(['email' => $email]);
        if ($existingUserEmail) {
            return new JsonResponse(['error' => 'El correo electrónico ya está en uso.'], 400);
        }
        $existingUsername = $doctrine->getRepository(User::class)->findOneBy((['username' => $username]));
        if ($existingUsername) {
            return new JsonResponse(['error' => 'El nombre de usuario ya está en uso.'], 400);
        }

        try {
            $user = new User();
            $user->setEmail($email);
            $user->setRoles(['ROLE_USER']);
            $user->setUsername(($username));
            $user->setRoles(['ROLE_USER']);

            $hashedPassword = $passwordHasher->hashPassword($user,
             $password);

            $user->setPassword($hashedPassword);

            $entityManager = $doctrine->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            $jwt = $jwtManager->create($user);

            return new JsonResponse(['token' => $jwt, 'success' => true], 200);

        } catch (\Exception $e) {

            return new JsonResponse(['error' => 'Se produjo un error al registrar el usuario'], 500);
        }
    }

    #[Route('/auth/login', name: 'auth_login')]
    public function login(Request $request, UserPasswordHasherInterface $passwordHasher, ManagerRegistry $doctrine, JWTTokenManagerInterface $jwtManager, SessionInterface $session)
    {
        $data = json_decode($request->getContent(), true);


        $username = $data['username'] ?? null;


        $userRepository = $doctrine->getRepository(User::class);
        $user = $userRepository->findOneBy(['username' => $username]);


        $jwt = $jwtManager->create($user);

        return new JsonResponse(['token' => $jwt, 'success' => true], 200);

    }

    public function extractAndValidateToken(Request $request, JWTTokenManagerInterface $jwtManager) {
        $authHeader = $request->headers->get('Authorization');

        if (!$authHeader) {
            return new JsonResponse(['error' => 'Token de autenticación no proporcionado'], 401);
        }


        $token = str_replace('Bearer ', '', $authHeader);

        try {

            $payload = $jwtManager->parse($token);
            $usernameFromToken = $payload['username'] ?? null;
        } catch (\Exception $e) {
            return new JsonResponse(['error' => 'Token de autenticación inválido'], 401);
        }

        if (!$usernameFromToken) {
            return new JsonResponse(['error' => 'Usuario no autenticado'], 401);
        }

        $user = $this->userRepository->findOneBy(['username' => $usernameFromToken]);

        if (!$user) {
            return new JsonResponse(['error' => 'Usuario no encontrado'], 404);
        }

        return $user;
    }


}
