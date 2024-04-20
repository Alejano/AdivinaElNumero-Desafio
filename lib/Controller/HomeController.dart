import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';

class HomeController{
  TextEditingController textFieldNumero = TextEditingController();
  late NivelesProvider intentop;
  late NumerosProvider numerosp;

  OnSaveTextFieldController(String value){
    print(value);
  }
}