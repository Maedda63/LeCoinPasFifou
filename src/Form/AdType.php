<?php

namespace App\Form;

use App\Entity\Ad;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class AdType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', TextType::class, array(
                'label' => 'Titre de l\'annonce',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
            ->add('description', TextareaType::class, array(
                'label' => 'Description',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
            ->add('picture', UrlType::class, array(
                'label' => 'Lien de l\'image',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
            ->add('price', NumberType::class, array(
                'label' => 'Prix (en €)',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
            ->add('place', null, array(
                'label' => 'Lieu',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
            ->add('category', null, array(
                'label' => 'Catégorie',
                'attr' => ['class' => 'form-control'],
                'label_attr' => ['class' => "col-sm-4 col-form-label"]
            ))
        ;
    }
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Ad::class,
        ]);
    }

    public function getBlockPrefix()
    {
        return "ad_form";
    }
}
