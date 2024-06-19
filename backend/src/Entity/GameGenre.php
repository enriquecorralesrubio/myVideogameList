<?php

namespace App\Entity;

use App\Repository\GameGenreRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: GameGenreRepository::class)]
class GameGenre
{

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Game::class, inversedBy: 'gameGenres')]
    #[ORM\JoinColumn(name: "game_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?Game $game = null;

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Genre::class, inversedBy: 'gameGenres')]
    #[ORM\JoinColumn(name: "genre_uuid", referencedColumnName: "uuid", nullable: false)]
    private ?Genre $genre = null;

    public function getGame(): ?Game
    {
        return $this->game;
    }

    public function setGame(?Game $game): static
    {
        $this->game = $game;

        return $this;
    }

    public function getGenre(): ?Genre
    {
        return $this->genre;
    }

    public function setGenre(?Genre $genre): static
    {
        $this->genre = $genre;

        return $this;
    }
}
