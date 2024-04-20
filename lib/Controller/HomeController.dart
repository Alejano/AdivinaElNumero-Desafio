import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';
import 'package:flutter/material.dart';

class HomeController{
  TextEditingController textFieldNumero = TextEditingController();
  late NivelesProvider intentop;
  late NumerosProvider numerosp;
  late ConfettiController controllerConfetti;

  onSaveTextFieldController(String? value,BuildContext context){
    if(value != null) {
      int numero = int.parse(value);
      int numeroAzar = intentop.getNumeroAdivinar;
      if (numero != 0 && numero <= intentop.getNumeroMaximo) {
        if (intentop.getNIntentos >= 2) {
          if (numeroAzar.compareTo(numero) == 0) {
            double seleccion = intentop.getNivelSelect;
            intentop.seleccionNivel(seleccion.toInt());
            numerosp.resetNumeros();
            numerosp.addHistorialNumero(
                Historial(numero: numero, estado: true));
            controllerConfetti.play();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Ganaste!!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          } else {
            if (numero > numeroAzar) {
              numerosp.addNumeroMenor(numero);
            }
            if (numero < numeroAzar) {
              numerosp.addNumeroMayor(numero);
            }
            intentop.restarIntentos();
          }
        } else {
          double seleccion = intentop.getNivelSelect;
          intentop.seleccionNivel(seleccion.toInt());
          numerosp.resetNumeros();
          numerosp.addHistorialNumero(
              Historial(numero: numeroAzar, estado: false));
        }
        textFieldNumero.clear();
      }else{
        textFieldNumero.clear();
      }
    }
  }


  onNivelChange(int value){
    intentop.seleccionNivel(value);
    numerosp.resetNumeros();
  }

}