import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:flutter/cupertino.dart';

class NumerosProvider extends ChangeNotifier{

  final List<Historial?> _numeros = [];
  final List<int> _numerosMayor = [];
  final List<int> _numerosMenor = [];

  List<Historial?> get getListHNumeros => _numeros;
  List<int> get getListNumMayor => _numerosMayor;
  List<int> get getListNumMenor => _numerosMenor;

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
}