import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumeroContainer extends StatelessWidget {
  String titulo;
  List<int> numeros;

  NumeroContainer({super.key, required this.titulo, required this.numeros});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(titulo),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height/4,
              child: ListView.builder(
                itemCount: numeros.length,
                itemBuilder: (_,index){
                  return Center(child: Text(numeros[index].toString()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
