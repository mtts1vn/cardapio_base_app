import 'package:cardapio/src/carrinho/carrinho.dart';
import 'package:flutter/material.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  final Carrinho _carrinho = Carrinho.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _carrinho.carrinhoL,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_carrinho.getCarrinho[index]['nome']),
                      trailing: Text(
                          'Quantidade: ${_carrinho.getCarrinho[index]['quantidade']}'),
                    );
                  }))
        ],
      ),
    );
  }
}
