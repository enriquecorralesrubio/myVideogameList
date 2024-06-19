<?php

namespace App\Repository;

use App\Entity\GameGenre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<GameGenre>
 *
 * @method GameGenre|null find($id, $lockMode = null, $lockVersion = null)
 * @method GameGenre|null findOneBy(array $criteria, array $orderBy = null)
 * @method GameGenre[]    findAll()
 * @method GameGenre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GameGenreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GameGenre::class);
    }

//    /**
//     * @return GameGenre[] Returns an array of GameGenre objects
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

//    public function findOneBySomeField($value): ?GameGenre
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
