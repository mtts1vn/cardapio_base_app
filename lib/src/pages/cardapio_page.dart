import 'package:cardapio/src/carrinho/carrinho.dart';
import 'package:cardapio/src/models/pizza_model.dart';
import 'package:cardapio/src/repositories/pizzas_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CardarioPage extends StatefulWidget {
  const CardarioPage({super.key});

  @override
  State<CardarioPage> createState() => _CardarioPageState();
}

class _CardarioPageState extends State<CardarioPage> {
  final PizzaRepository _pizzaRepository = PizzaRepository();
  final Carrinho _carrinho = Carrinho.getInstance();
  late List<Pizza> _pizzaList;
  late Pizza _selectedPizza;
  @override
  void initState() {
    super.initState();
    _pizzaList = _pizzaRepository.getPizzas;
    _selectedPizza = _pizzaList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/carrinho');
                  },
                  icon: Icon(Icons.shopping_cart_rounded)))
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: _pizzaList.map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        'assets/images/src/' + i.image,
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                setState(() {
                  _selectedPizza = _pizzaList[page];
                });
              },
              height: 400,
              enableInfiniteScroll: true,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_pizza_rounded,
                        color: Colors.amber,
                      ),
                      Text(
                        _selectedPizza.nome,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: Colors.green,
                      ),
                      Text(
                        'R\$ ${_selectedPizza.preco.toString().replaceAll('.', ',')}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            child: ListView.builder(
              itemCount: _selectedPizza.ingredientes.length,
              scrollDirection: axisDirectionToAxis(AxisDirection.right),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 2, left: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3, left: 3),
                        child: Text(
                          _selectedPizza.ingredientes[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Comprar Agora'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _carrinho.addPizzaToCart(
                        {'nome': _selectedPizza.nome, 'quantidade': 1});
                  },
                  child: const Text('Adicionar ao carrinho'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
