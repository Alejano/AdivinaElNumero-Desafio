import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:adivina_numero_desafio/providers/NumerosProvider.dart';
import 'package:adivina_numero_desafio/widgets/NumeroContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:adivina_numero_desafio/widgets/HistorialNumeroContainer.dart';



class Home extends StatefulWidget {
  static String id = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (e){
                      },
                      decoration: const InputDecoration(
                        helperText: "###",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )
                      ),
                    ),
                  ),
                  const Expanded(
                    child: ListTile(
                      title: Text("Intentos",textAlign: TextAlign.center,),
                      subtitle: Text("0",textAlign: TextAlign.center,),
                    )
                  )
                ],
              ),
            ),
            Consumer<NumerosProvider>(
              builder: (context,provedor, child){
                return Row(
                  children: [
                    Expanded(child: NumeroContainer(titulo: "Mayor que", numeros: provedor.getListNumMayor)),
                    Expanded(child: NumeroContainer(titulo: 'Menor que', numeros: provedor.getListNumMenor,)),
                    Expanded(child: HistorialNumeroContainer(titulo: 'Historial', numeros: provedor.getListHNumeros,))
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}



PreferredSizeWidget buildBar(BuildContext context) {
  return AppBar(
    title: const Text("Adivina el Numero"),
    actions: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
    ],
  );
}
