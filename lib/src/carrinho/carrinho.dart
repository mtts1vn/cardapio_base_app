class Carrinho {
  static Carrinho? _instance;
  Carrinho._();

  static Carrinho getInstance() {
    if (_instance == null) {
      _instance = Carrinho._();
    }
    return _instance!;
  }

  List<Map> _carrinho = [];
  get carrinhoL => _carrinho.length;
  get getCarrinho => _carrinho;

  void addPizzaToCart(Map item) {
    Map consulta = addJaAdd(item);
    if (consulta['contem']) {
      _carrinho[consulta['index']]['quantidade'] += 1;
    } else {
      _carrinho.add(item);
    }
    print(_carrinho);
  }

  Map addJaAdd(Map item) {
    for (int i = 0; i < _carrinho.length; i++) {
      if (_carrinho[i]['nome'] == item['nome']) {
        return {'contem': true, 'index': i};
      }
    }
    return {'contem': false};
  }
}
