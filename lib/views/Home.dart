import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



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
                    child: Card(
                      child: Column(
                        children: [
                          Text("Intentos"),
                          Text("0")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
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
