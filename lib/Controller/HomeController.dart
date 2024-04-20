import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';

class HomeController{
  TextEditingController textFieldNumero = TextEditingController();
  late NivelesProvider intentop;
  late NumerosProvider numerosp;

  onSaveTextFieldController(String value){
    int numero = int.parse(value);
    int numeroAzar = intentop.getNumeroAdivinar;
    if(intentop.getNIntentos >= 2) {
      if (numeroAzar.compareTo(numero) == 0) {
        double seleccion = intentop.getNivelSelect;
        intentop.seleccionNivel(seleccion.toInt());
        numerosp.resetNumeros();
        numerosp.addHistorialNumero(Historial(numero: numero, estado: true));
      }else {
        if (numero > numeroAzar) {
          numerosp.addNumeroMenor(numero);
        }
        if (numero < numeroAzar) {
          numerosp.addNumeroMayor(numero);
        }
        intentop.restarIntentos();
      }
    }else{
      double seleccion = intentop.getNivelSelect;
      intentop.seleccionNivel(seleccion.toInt());
      numerosp.resetNumeros();
      numerosp.addHistorialNumero(Historial(numero: numero, estado: false));
    }
    textFieldNumero.clear();
  }

  onNivelChange(int value){
    intentop.seleccionNivel(value);
    numerosp.resetNumeros();
  }

}