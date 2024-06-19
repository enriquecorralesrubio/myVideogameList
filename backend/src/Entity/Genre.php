<?php

namespace App\Entity;

use App\Repository\GenreRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Ramsey\Uuid\Doctrine\UuidGenerator;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: GenreRepository::class)]
class Genre
{

    #[ORM\Id]
    #[ORM\Column(type: "uuid")]
    #[ORM\GeneratedValue(strategy: "CUSTOM")]
    #[ORM\CustomIdGenerator(class: UuidGenerator::class)]

    private ?string $uuid = null;

    #[Assert\NotBlank]
    #[ORM\Column(type: "string", length: 255)]
    private ?string $name = null;

    #[ORM\OneToMany(targetEntity: GameGenre::class, mappedBy: 'genre', orphanRemoval: true)]
    private Collection $gameGenres;

    public function __construct()
    {
        $this->gameGenres = new ArrayCollection();
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
            $gameGenre->setGenre($this);
        }

        return $this;
    }

    public function removeGameGenre(GameGenre $gameGenre): static
    {
        if ($this->gameGenres->removeElement($gameGenre)) {
            // set the owning side to null (unless already changed)
            if ($gameGenre->getGenre() === $this) {
                $gameGenre->setGenre(null);
            }
        }

        return $this;
    }
}
