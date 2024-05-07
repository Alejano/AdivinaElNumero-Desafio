import 'dart:math';

import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  final List<Historial?> _numeros = [];
  final List<int> _numerosMayor = [];
  final List<int> _numerosMenor = [];

  List<Historial?> get getListHNumeros => _numeros;
  List<int> get getListNumMayor => _numerosMayor;
  List<int> get getListNumMenor => _numerosMenor;

  Color fildcolor = Colors.black;
  String textHepl = "";
  double nivelSelect = 0;
  int intentos = 5;
  int numeroAzar = 1;
  int nmaximo = 10;
  final Set<String> _niveles = {'Facil','Medio','Dificil','Extremo'};
  final Set<String> _nivelesEjenplo = {'1 al 10','1 al 20','1 al 100','1 al 1000'};
  TextEditingController textFieldNumero = TextEditingController();

  late ConfettiController controllerConfetti= ConfettiController(duration: const Duration(seconds: 5));


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


  addHistorialNumero(Historial numero){
    _numeros.add(numero);
    notifyListeners();
  }
  addNumeroMayor(int numero){
    _numerosMayor.add(numero);
    notifyListeners();
  }
  addNumeroMenor(int numero){
    _numerosMenor.add(numero);
    notifyListeners();
  }
  resetNumeros(){
    _numerosMayor.clear();
    _numerosMenor.clear();
    notifyListeners();
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

  onSaveTextFieldController(String? value,BuildContext context){
    if(value != null && value.isNotEmpty) {
      int numero = int.parse(value);
      int numeroAzar = getNumeroAdivinar;
      if (numero != 0 && numero <= getNumeroMaximo) {
        if (getNIntentos >= 2) {
          if (numeroAzar.compareTo(numero) == 0) {
            double seleccion = getNivelSelect;
            seleccionNivel(seleccion.toInt());
            resetNumeros();
            addHistorialNumero(
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
              addNumeroMenor(numero);
            }
            if (numero < numeroAzar) {
              addNumeroMayor(numero);
            }
            restarIntentos();
          }
        } else {
          getNivelSelect;
          seleccionNivel(nivelSelect.toInt());
          resetNumeros();
          addHistorialNumero(
              Historial(numero: numeroAzar, estado: false));
        }
        textFieldNumero.clear();
      }else{
        textFieldNumero.clear();
      }
    }
    else{
        fildcolor = Colors.red;
        textHepl ="Debes seleccionar un numero \n de ${obtenEjemplo()}";
    }
    notifyListeners();
  }
  onEditingComplete(){
    if(textFieldNumero.text != null && textFieldNumero.text.isNotEmpty) {
      int valor = int.parse(
          textFieldNumero.text);
      if (valor > getNumeroMaximo) {
          fildcolor = Colors.red;
          textHepl ="Debes seleccionar un numero \n de ${obtenEjemplo()}";
      } else {
          fildcolor = Colors.black;
          textHepl = "";

      }
    }
    else{
      fildcolor = Colors.red;
      textHepl ="Debes seleccionar un numero \n de ${obtenEjemplo()}";
    }
  }

  onNivelChange(int value){
    seleccionNivel(value);
    resetNumeros();
  }

}