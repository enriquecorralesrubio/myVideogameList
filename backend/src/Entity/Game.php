<?php

namespace App\Entity;

use App\Repository\GameRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Ramsey\Uuid\Doctrine\UuidGenerator;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: GameRepository::class)]
class Game
{
    #[ORM\Id]
    #[ORM\Column(type: "uuid")]
    #[ORM\GeneratedValue(strategy: "CUSTOM")]
    #[ORM\CustomIdGenerator(class: UuidGenerator::class)]

    private ?string $uuid = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank]
    private ?string $name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $developer = null;

    #[ORM\Column(nullable: true)]
    private ?float $global_rating = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $cover = null;

    #[ORM\Column(type: 'text', nullable: true)]
    private ?string $synopsis = null;

    #[ORM\OneToMany(targetEntity: GamePlatform::class, mappedBy: 'game', orphanRemoval: true)]
    private Collection $gamePlatforms;

    #[ORM\OneToMany(targetEntity: GameGenre::class, mappedBy: 'game', orphanRemoval: true)]
    private Collection $gameGenres;

    #[ORM\OneToMany(targetEntity: GameUser::class, mappedBy: 'game', orphanRemoval: true)]
    private Collection $gameUsers;

    public function __construct()
    {
        $this->gamePlatforms = new ArrayCollection();
        $this->gameGenres = new ArrayCollection();
        $this->gameUsers = new ArrayCollection();
    }


    public function getUuid(): ?string
    {
        return $this->uuid;
    }

    public function setUuid(string $uuid): static
    {
        $this->uuid = $uuid;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getDeveloper(): ?string
    {
        return $this->developer;
    }

    public function setDeveloper(?string $developer): static
    {
        $this->developer = $developer;

        return $this;
    }

    public function getGlobalRating(): ?float
    {
        return $this->global_rating;
    }

    public function setGlobalRating(?float $global_rating): static
    {
        $this->global_rating = $global_rating;

        return $this;
    }

    public function getCover(): ?string
    {
        return $this->cover;
    }

    public function setCover(?string $cover): static
    {
        $this->cover = $cover;

        return $this;
    }

    public function getSynopsis(): ?string
    {
        return $this->synopsis;
    }

    public function setSynopsis(?string $synopsis): static
    {
        $this->synopsis = $synopsis;

        return $this;
    }

    /**
     * @return Collection<int, GamePlatform>
     */
    public function getGamePlatforms(): Collection
    {
        return $this->gamePlatforms;
    }

    public function addGamePlatform(GamePlatform $gamePlatform): static
    {
        if (!$this->gamePlatforms->contains($gamePlatform)) {
            $this->gamePlatforms->add($gamePlatform);
            $gamePlatform->setGame($this);
        }

        return $this;
    }

    public function removeGamePlatform(GamePlatform $gamePlatform): static
    {
        if ($this->gamePlatforms->removeElement($gamePlatform)) {
            if ($gamePlatform->getGame() === $this) {
                $gamePlatform->setGame(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, GameGenre>
     */
    public function getGameGenres(): Collection
    {
        return $this->gameGenres;
    }

    public function addGameGenre(GameGenre $gameGenre): static
    {
        if (!$this->gameGenres->contains($gameGenre)) {
            $this->gameGenres->add($gameGenre);
            $gameGenre->setGame($this);
        }

        return $this;
    }

    public function removeGameGenre(GameGenre $gameGenre): static
    {
        if ($this->gameGenres->removeElement($gameGenre)) {
            if ($gameGenre->getGame() === $this) {
                $gameGenre->setGame(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, GameUser>
     */
    public function getGameUsers(): Collection
    {
        return $this->gameUsers;
    }

    public function addGameUser(GameUser $gameUser): static
    {
        if (!$this->gameUsers->contains($gameUser)) {
            $this->gameUsers->add($gameUser);
            $gameUser->setGame($this);
        }

        return $this;
    }

    public function removeGameUser(GameUser $gameUser): static
    {
        if ($this->gameUsers->removeElement($gameUser)) {

            if ($gameUser->getGame() === $this) {
                $gameUser->setGame(null);
            }
        }

        return $this;
    }

    public function updateGlobalRating(): void
    {
        $gameUsers = $this->gameUsers;

        if ($gameUsers->isEmpty()) {
            $this->setGlobalRating(null);
            return;
        }

        $totalRating = 0;
        $totalUsers = 0;

        foreach ($gameUsers as $gameUser) {
            $userRating = $gameUser->getUserRating();
            if ($userRating !== null && $userRating >= 1) {
                $totalRating += $userRating;
                $totalUsers++;
            }
        }

        if ($totalUsers === 0) {
            $this->setGlobalRating(null);
            return;
        }

        $globalRating = round($totalRating / $totalUsers, 2);

        $this->setGlobalRating($globalRating);
    }

    public function removeAllPlatforms()
    {
        foreach ($this->gamePlatforms as $gamePlatform) {
            $this->removeGamePlatform($gamePlatform);
        }
    }

    public function removeAllGenres()
    {
        foreach ($this->gameGenres as $gameGenre) {
            $this->removeGameGenre($gameGenre);
        }
    }

    public function hasGenre(Genre $genre): bool
    {
        return $this->gameGenres->exists(function ($key, GameGenre $gameGenre) use ($genre) {
            return $gameGenre->getGenre() === $genre;
        });
    }

    public function hasPlatform(Platform $platform): bool
    {
        return $this->gamePlatforms->exists(function ($key, GamePlatform $gamePlatform) use ($platform) {
            return $gamePlatform->getPlatform() === $platform;
        });
    }
}
