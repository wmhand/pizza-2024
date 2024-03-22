<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use App\Repository\CategoryRepository;
use App\Repository\OrderRepository;
use App\Repository\PizzaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PizzaController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(CategoryRepository $categoryRepository): Response
    {
        $category = $categoryRepository->findAll();
        return $this->render('pizza/index.html.twig', [
            'controller_name' => 'PizzaController',
            'category' => $category

        ]);
    }

    #[Route('/pizza/{id}', name: 'app_pizza')]
    public function pizzas(PizzaRepository $pizzaRepository, Category $category): Response
    {
        $pizzas = $pizzaRepository->findBy(['category'=> $category]);
        return $this->render('pizza/pizza.html.twig', [
            'controller_name' => 'PizzaController',
            'pizzas' => $pizzas

        ]);
    }

    #[Route('/order/{id}', name: 'order')]
    public function order(Request $request, EntityManagerInterface $em,$id): Response
    {
        $pizza=$em->getRepository(Pizza::class)->find($id);
        $order = new Order();
        $form= $this->createForm(OrderType::class, $order);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $order= $form->getData();
            $order->setPizza($pizza);
            $em->persist($order);
            $em->flush();

            $this->addFlash('succes','Uw bestelling zal worden voorbereid!');
        }

        return $this->renderForm('pizza/order.html.twig', [
            'controller_name' => 'PizzaController',
            'orderForm'=>$form

        ]);
    }









    #[Route('/contact', name: 'contact')]
    public function contact(): Response
    {

        return $this->render('pizza/contact.html.twig', [
            'controller_name' => 'PizzaController',


        ]);
    }

}
