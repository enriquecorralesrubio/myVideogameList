<?php

namespace App\Entity;

use App\Repository\PlatformRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Ramsey\Uuid\Doctrine\UuidGenerator;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: PlatformRepository::class)]
class Platform
{

    #[ORM\Id]
    #[ORM\Column(type: "uuid")]
    #[ORM\GeneratedValue(strategy: "CUSTOM")]
    #[ORM\CustomIdGenerator(class: UuidGenerator::class)]

    private ?string $uuid = null;

    #[Assert\NotBlank]
    #[ORM\Column(type: "string", length: 255)]
    private ?string $name = null;

    #[ORM\OneToMany(targetEntity: GamePlatform::class, mappedBy: 'platform', orphanRemoval: true)]
    private Collection $gamePlatforms;

    public function __construct()
    {
        $this->gamePlatforms = new ArrayCollection();
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
            $gamePlatform->setPlatform($this);
        }

        return $this;
    }

    public function removeGamePlatform(GamePlatform $gamePlatform): static
    {
        if ($this->gamePlatforms->removeElement($gamePlatform)) {
            // set the owning side to null (unless already changed)
            if ($gamePlatform->getPlatform() === $this) {
                $gamePlatform->setPlatform(null);
            }
        }

        return $this;
    }
}