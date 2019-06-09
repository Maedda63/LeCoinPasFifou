<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use App\Service\AdService;
use App\Entity\Ad;
use App\Form\AdType;

class AdController extends AbstractController
{
    private $adService;
    public function __construct( AdService $adService ){
        $this->adService = $adService;
    }
    static function buildSorter(String $key, Bool $asc) {
        return function ($ad1, $ad2) use ($key, $asc) {
            if($asc) {
                $coeff = 1;
            } else {
                $coeff = -1;
            }
            if( $ad1->{$key}() < $ad2->{$key}() ) {
                return -1 * $coeff;
            }
            if( $ad1->{$key}() > $ad2->{$key}() ) {
                return 1 * $coeff;
            }
            return 0;
        };
    }
    /**
     * @Route("/ads", name="ad_list")
     */
    public function list( Request $request ){
        $query = $request->query->get('query');
        if( !empty( $query ) ){
            $ads = $this->adService->searchAd( $query );
        }else{
            $ads = $this->adService->getAll();
        }
        $sort = $request->query->get('sort');
        if( empty( $sort ) ){
            $sort = 4;
        }
        // - 1 price ascending
        // - 2 price descending
        // - 3 createAt ascending
        // - 4 createAt descending
        if( $sort == 1 || $sort == 2) {
            $property = 'getPrice';
        } else {
            $property = 'getCreatedAt';
        }
        $asc = $sort % 2 == 1;
        usort($ads, $this->buildSorter($property, $asc));
        return $this->render( 'ad/list.html.twig', array(
            'ads' => $ads,
            'query' => $query
        ));
    }
    /**
     * @Route("/ad/add", name="ad_add")
     */
    public function add( Request $request ){
        $ad = new Ad();
        $em = $this->getDoctrine()->getManager();
        $ad->setCreatedAt( new \DateTime() );
        $user = $em->getRepository('App:User')->findOneBy( array(
            'id' => '1'
        ) );
        $ad->setOwner( $user );
        $form = $this->createForm( AdType::class, $ad );
        $form->handleRequest( $request );
        if( $form->isSubmitted() && $form->isValid() ){
            $em->persist( $ad );
            $em->flush();
            return $this->redirectToRoute( 'ad_show', array(
                'id' => $ad->getId(),
            ));
        }
        return $this->render( 'ad/add.html.twig', array(
            'form' => $form->createView(),
        ));
    }
    /**
     * @Route("/ad/{id}", name="ad_show",
     *     requirements = { "id" = "\d+" }
     * )
     */
    public function show( $id ){
        return $this->render( 'ad/show.html.twig', array(
            'ad' => $this->adService->get( $id ),
        ));
    }
    /**
     * @Route("/ad/{id}/join", name="ad_join",
     *     requirements = { "id" = "\d+" }
     * )
     */
    public function join( $id ){
        return new Response('Ad join : ' . $id );
    }
}
