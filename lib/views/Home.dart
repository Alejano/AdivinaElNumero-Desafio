
import 'package:adivina_numero_desafio/providersController/HomeProvider.dart';
import 'package:adivina_numero_desafio/widgets/NumeroContainer.dart';
import 'package:adivina_numero_desafio/widgets/SlideButtonSteps.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:adivina_numero_desafio/widgets/HistorialNumeroContainer.dart';

class Home extends StatelessWidget {
  static String id = "Home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, nup, child) {
          return Scaffold(
            appBar: buildBar(context),
            body: Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextField(
                                  maxLength: nup.getMaxLength,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  keyboardType: const TextInputType
                                      .numberWithOptions(
                                      signed: true),
                                  controller: nup.textFieldNumero,
                                  decoration: InputDecoration(
                                      labelText: nup.getLenghNA,
                                      hintText: "Numero",
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      suffixIconColor: nup.fildcolor,
                                      prefixIconColor: nup.fildcolor,
                                      fillColor: nup.fildcolor,
                                      focusColor: nup.fildcolor,
                                      hoverColor: nup.fildcolor,
                                      helperText: nup.textHepl,
                                      helperStyle: const TextStyle(fontSize: 6)
                                  ),
                                  textInputAction: TextInputAction.done,
                                  cursorColor: nup.fildcolor,
                                  onSubmitted: (value) =>
                                      nup.onSaveTextFieldController(
                                          value, context),
                                  onEditingComplete: () {
                                    nup.onEditingComplete();
                                    nup.controllerConfetti.play();
                                  },
                                ),
                              ),
                              Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      "Intentos", textAlign: TextAlign.center,),
                                    subtitle: Text(nup.getIntentos,
                                      textAlign: TextAlign.center,),
                                  )
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(child: NumeroContainer(
                                titulo: "Mayor que", numeros: nup
                                .getListNumMayor)),
                            Expanded(child: NumeroContainer(
                              titulo: 'Menor que', numeros: nup
                                .getListNumMenor,)),
                            Expanded(child: HistorialNumeroContainer(
                              titulo: 'Historial', numeros: nup
                                .getListHNumeros,))
                          ],
                        ),
                        const Divider(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const Text("Dificultad:"),
                            SlideButtonSteps(
                              title: nup.getNiveles[nup.nivelSelect.toInt()],
                              steps: nup.getNiveles.length - 1,
                              currentStep: nup.nivelSelect,
                              change: (int value) =>
                                  nup.onNivelChange(value),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  ConfettiWidget(
                    confettiController: nup.controllerConfetti,
                    maxBlastForce: 5,
                    minBlastForce: 2,
                    blastDirection: 250,
                    // radial value - RIGHT
                    particleDrag: 0.05,
                    // apply drag to the confetti
                    emissionFrequency: 0.05,
                    // how often it should emit
                    numberOfParticles: 20,
                    // number of particles to emit
                    gravity: 0.02,
                    // gravity - or fall speed
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                  ),
                ]
            ),
          );
        }
    );
  }
}

PreferredSizeWidget buildBar(BuildContext context) {
  return AppBar(
    title: const Text("Adivina el Numero"),
    actions: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
    ],
  );
}
