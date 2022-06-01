import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:provider_changenotifier/pedido_model.dart';

class PedidosProvider with ChangeNotifier {
  final List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => [..._pedidos];

  int get total {
    int total = 0;
    for (var pedido in _pedidos) {
      total += pedido.valor;
    }
    return total;
  }

  int get quantidadeDePedidos => _pedidos.length;

  void addPedido() {
    final valor = Random().nextInt(100) + 1;
    final hora = DateFormat.Hms().format(DateTime.now());

    Pedido novoPedido = Pedido(valor: valor, horaDoPedido: hora);
    _pedidos.add(novoPedido);
    notifyListeners();
  }
}
