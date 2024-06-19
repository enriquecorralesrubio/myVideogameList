<?php

namespace App\Entity;

use App\Repository\GamePlatformRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: GamePlatformRepository::class)]

class GamePlatform
{

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Game::class, inversedBy: 'gamePlatforms')]
    #[ORM\JoinColumn(name: "game_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?Game $game = null;

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Platform::class, inversedBy: 'gamePlatforms')]
    #[ORM\JoinColumn(name: "platform_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?Platform $platform = null;

    public function getGame(): ?Game
    {
        return $this->game;
    }

    public function setGame(?Game $game): static
    {
        $this->game = $game;

        return $this;
    }

    public function getPlatform(): ?Platform
    {
        return $this->platform;
    }

    public function setPlatform(?Platform $platform): static
    {
        $this->platform = $platform;

        return $this;
    }


}