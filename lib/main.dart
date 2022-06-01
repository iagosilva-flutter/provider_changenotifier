import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_changenotifier/pedidos_provider.dart';
import 'package:provider_changenotifier/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PedidosProvider()),
      ],
      child: MaterialApp(
        title: 'Provider e ChangeNotifier',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
