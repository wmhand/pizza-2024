<?php

namespace App\Entity;

use App\Repository\SizeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SizeRepository::class)]
class Size
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\OneToMany(mappedBy: 'size', targetEntity: Order::class)]
    private Collection $orderr;

    public function __construct()
    {
        $this->orderr = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Order>
     */
    public function getOrderr(): Collection
    {
        return $this->orderr;
    }

    public function addOrderr(Order $orderr): self
    {
        if (!$this->orderr->contains($orderr)) {
            $this->orderr->add($orderr);
            $orderr->setSize($this);
        }

        return $this;
    }

    public function removeOrderr(Order $orderr): self
    {
        if ($this->orderr->removeElement($orderr)) {
            // set the owning side to null (unless already changed)
            if ($orderr->getSize() === $this) {
                $orderr->setSize(null);
            }
        }

        return $this;
    }

}