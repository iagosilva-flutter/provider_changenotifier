import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier/pedidos_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PedidosProvider>(context);
    final pedidos = provider.pedidos;

    void _gerarPedido() {
      provider.addPedido();
    }

    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text('Clique no + para add um pedido'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Valor total dos pedidos ${provider.total}'),
            Expanded(
              child: ListView.builder(
                itemCount: provider.quantidadeDePedidos,
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    title: Text(pedidos[index].horaDoPedido),
                    trailing: Text(
                        'Valor aleatorio:${pedidos[index].valor.toString()}'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gerarPedido,
        child: const Icon(Icons.add),
      ),
    );
  }
}
