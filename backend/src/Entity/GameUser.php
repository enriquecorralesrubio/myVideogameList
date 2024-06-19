<?php

namespace App\Entity;

use App\Repository\GameUserRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: GameUserRepository::class)]
class GameUser
{

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'gameUsers')]
    #[ORM\JoinColumn(name: "user_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?User $user = null;

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Game::class, inversedBy: 'gameUsers')]
    #[ORM\JoinColumn(name: "game_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?Game $game = null;

    #[ORM\Column(nullable: true)]
    private ?float $userRating = null;

    #[ORM\Column(nullable: true)]
    #[Assert\Type(type: 'integer')]
    private ?int $timePlayed = null;

    #[ORM\Column(type: 'string', length: 255, options: ['default' => 'pendiente'])]
    #[Assert\Choice(choices: ['finalizado', 'pendiente', 'jugando', 'deseado'])]
    private ?string $state = null;


    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function getGame(): ?Game
    {
        return $this->game;
    }

    public function setGame(?Game $game): static
    {
        $this->game = $game;

        return $this;
    }

    public function getUserRating(): ?float
    {
        return $this->userRating;
    }

    public function setUserRating(?float $userRating): static
    {
        if ($userRating !== null) {
            $userRating = round($userRating, 2);
        }
        $this->userRating = $userRating;

        return $this;
    }

    public function getTimePlayed(): ?int
    {
        return $this->timePlayed;
    }

    public function setTimePlayed(?int $timePlayed): static
    {
        $this->timePlayed = $timePlayed;

        return $this;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): static
    {
        $this->state = $state;

        return $this;
    }
}
