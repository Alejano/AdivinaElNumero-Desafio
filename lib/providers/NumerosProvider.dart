import 'package:adivina_numero_desafio/models/Historial.dart';
import 'package:flutter/cupertino.dart';

class NumerosProvider extends ChangeNotifier{

  final List<Historial?> _numeros = [];

  List<Historial?> get getListXFile => _numeros;

  addNumero(Historial numero){
    _numeros.add(numero);
  }
}