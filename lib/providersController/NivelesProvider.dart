import 'dart:math';

import 'package:flutter/cupertino.dart';

class NivelesProvider extends ChangeNotifier{
  double nivelSelect = 0;
  int intentos = 0;
  int numeroAzar = 1;
  final Set<String> _niveles = {'Facil','Medio','Dificil','Extremo'};

  List<String> get getNiveles => _niveles.toList();
  String get getIntentos => intentos.toString();

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
        break;
      case (1):
        intentos = 8;
        nivelSelect = 1;
        numeroAzar = Random().nextInt(20)+1;
        getLenghNA;
        break;
      case (2):
        intentos = 15;
        nivelSelect = 2;
        numeroAzar = Random().nextInt(100)+1;
        break;
      case (3):
        intentos = 25;
        nivelSelect = 3;
        numeroAzar = Random().nextInt(1000)+1;
        break;
      default:
        intentos = 5;
        nivelSelect = 0;
        numeroAzar = Random().nextInt(10)+1;
        break;
    }
    print("Numero a adivinar");
    print(numeroAzar);
    notifyListeners();
  }


}