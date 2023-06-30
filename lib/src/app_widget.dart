import 'package:cardapio/src/pages/cardapio_page.dart';
import 'package:cardapio/src/pages/carrinho_page.dart';
import 'package:cardapio/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/cardapio': (context) => const CardarioPage(),
        '/carrinho': (context) => const CarrinhoPage(),
      },
    );
  }
}
