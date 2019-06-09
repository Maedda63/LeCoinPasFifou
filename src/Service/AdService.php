<?php 
namespace App\Service;

use App\Repository\AdRepository;

class AdService {
    private $repository;

    public function __construct(AdRepository $repository) {
        $this->repository = $repository;
    }

    public function getAll() {
        return $this->repository->findAll();
    }

    public function get($id) {
        return $this->repository->findOneBy(array(
            'id' => $id,
        ));
    }

    public function searchAd($term) {
        return $this->repository->searchAd($term);
    }
}