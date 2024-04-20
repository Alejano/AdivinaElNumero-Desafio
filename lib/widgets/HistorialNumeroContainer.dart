import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistorialNumeroContainer extends StatelessWidget {
  String titulo;
  List<Historial?> numeros;

  HistorialNumeroContainer({super.key, required this.titulo, required this.numeros});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(titulo),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height/4,
              child: ListView.builder(
                itemCount: numeros.length,
                itemBuilder: (_,index){
                  Historial? hn = numeros[index];
                  return Center(
                    child: Text(numeros[index]!.numero.toString(),
                      style: TextStyle(
                          color: (hn!.estado)?Colors.green:Colors.red
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
