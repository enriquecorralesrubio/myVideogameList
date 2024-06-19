<?php

namespace App\Repository;

use App\Entity\GamePlatform;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<GamePlatform>
 *
 * @method GamePlatform|null find($id, $lockMode = null, $lockVersion = null)
 * @method GamePlatform|null findOneBy(array $criteria, array $orderBy = null)
 * @method GamePlatform[]    findAll()
 * @method GamePlatform[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GamePlatformRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GamePlatform::class);
    }

//    /**
//     * @return GamePlatform[] Returns an array of GamePlatform objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('g.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?GamePlatform
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
