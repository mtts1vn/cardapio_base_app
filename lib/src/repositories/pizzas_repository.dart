import 'package:cardapio/src/models/pizza_model.dart';

class PizzaRepository {
  List<Pizza> _pizzas = [
    Pizza(
      nome: "Pizza de Calabresa",
      image: "pizza1.png",
      preco: 30.0,
      ingredientes: [
        "Molho de tomate",
        "Queijo",
        "Calabresa",
        "Cebola",
        "Orégano"
      ],
    ),
    Pizza(
      nome: "Pizza Margherita",
      image: "pizza2.png",
      preco: 25.0,
      ingredientes: ["Molho de tomate", "Queijo", "Manjericão"],
    ),
    Pizza(
      nome: "Pizza Quatro Queijos",
      image: "pizza3.png",
      preco: 35.0,
      ingredientes: [
        "Molho de tomate",
        "Queijo mussarela",
        "Queijo gorgonzola",
        "Queijo provolone",
        "Queijo parmesão"
      ],
    ),
    Pizza(
      nome: "Pizza Vegetariana",
      image: "pizza4.png",
      preco: 28.0,
      ingredientes: [
        "Molho de tomate",
        "Queijo",
        "Pimentão",
        "Cebola",
        "Cogumelos",
        "Azeitonas"
      ],
    ),
  ];

  get getPizzas => _pizzas;
}
