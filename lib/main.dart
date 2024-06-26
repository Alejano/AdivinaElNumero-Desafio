import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adivina_numero_desafio/views/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => NumerosProvider()),
       ChangeNotifierProvider(create: (_) => NivelesProvider())
    ],
      child:MaterialApp(
        home: const Home(),
        initialRoute: Home.id,
      )
  );
  }
}
