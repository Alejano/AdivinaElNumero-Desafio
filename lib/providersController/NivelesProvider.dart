import 'dart:math';

import 'package:flutter/cupertino.dart';

class NivelesProvider extends ChangeNotifier{
  double nivelSelect = 0;
  int intentos = 5;
  int numeroAzar = 1;
  int nmaximo = 10;
  final Set<String> _niveles = {'Facil','Medio','Dificil','Extremo'};
  final Set<String> _nivelesEjenplo = {'1 al 10','1 al 20','1 al 100','1 al 1000'};


  List<String> get getNiveles => _niveles.toList();
  int get getNIntentos => intentos;
  int get getNumeroAdivinar => numeroAzar;
  int get getNumeroMaximo => nmaximo;
  double get getNivelSelect => nivelSelect;
  String get getIntentos => intentos.toString();
  int get getMaxLength =>nmaximo.abs().toString().length;
  String get getLenghNA{
    String etiqueta ="";
    print(numeroAzar.abs().toString().length);
    for (int x=0; x < numeroAzar.abs().toString().length;x++ ) {
      etiqueta = "$etiqueta#";
    }
    return etiqueta;
  }


  seleccionNivel(int x){
    switch (x){
      case (0):
        intentos = 5;
        nivelSelect = 0;
        numeroAzar = Random().nextInt(10)+1;
        nmaximo = 10;
        break;
      case (1):
        intentos = 8;
        nivelSelect = 1;
        numeroAzar = Random().nextInt(20)+1;
        nmaximo = 20;
        break;
      case (2):
        intentos = 15;
        nivelSelect = 2;
        numeroAzar = Random().nextInt(100)+1;
        nmaximo = 100;
        break;
      case (3):
        intentos = 25;
        nivelSelect = 3;
        numeroAzar = Random().nextInt(1000)+1;
        nmaximo = 1000;
        break;
      default:
        intentos = 5;
        nivelSelect = 0;
        numeroAzar = Random().nextInt(10)+1;
        nmaximo = 10;
        break;
    }
    notifyListeners();
  }

  restarIntentos(){
    intentos = intentos -1;
    notifyListeners();
  }

  obtenEjemplo(){
    return _nivelesEjenplo.toList()[nivelSelect.toInt()];
  }
}