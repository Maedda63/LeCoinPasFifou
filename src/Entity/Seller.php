<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
/**
 * @ORM\Entity(repositoryClass="App\Repository\SellerRepository")
 */
class Seller
{
    /**
     * @ORM\Id()
     * @ORM\ManyToOne(targetEntity="App\Entity\Ad", inversedBy="sellers")
     * @ORM\JoinColumn(nullable=false)
     */
    private $ad;

    /**
     * @ORM\Id()
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="sellers")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $saleNumber;

    public function getAd(): ?Ad
    {
        return $this->ad;
    }
    public function setAd(?Ad $ad): self
    {
        $this->ad = $ad;
        return $this;
    }
    public function getUser(): ?User
    {
        return $this->user;
    }
    public function setUser(?User $user): self
    {
        $this->user = $user;
        return $this;
    }
    public function getSaleNumber(): ?string
    {
        return $this->saleNumber;
    }
    public function setSaleNumber(string $saleNumber): self
    {
        $this->saleNumber = $saleNumber;
        return $this;
    }
}