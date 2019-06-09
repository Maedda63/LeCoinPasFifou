<?php

namespace App\Repository;

use App\Entity\Ad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;


class AdRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Ad::class);
    }

    public function searchAd($term)
    {
        $stmt = $this->createQueryBuilder('ad');

        $stmt->where('ad.title LIKE :term OR ad.description LIKE :term');
        $stmt->setParameter(':term', '%' . $term . '%');

        return $stmt->getQuery()->getResult();
    }
}
