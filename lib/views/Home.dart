
import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';
import 'package:adivina_numero_desafio/widgets/NumeroContainer.dart';
import 'package:adivina_numero_desafio/widgets/SlideButtonSteps.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:adivina_numero_desafio/widgets/HistorialNumeroContainer.dart';
import 'package:adivina_numero_desafio/Controller/HomeController.dart';


class Home extends StatefulWidget {
  static String id = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = HomeController();

  Color fildcolor = Colors.black;
  String textHepl = "";

  @override
  void initState() {
    super.initState();
    homeController.controllerConfetti = ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    homeController.controllerConfetti.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    homeController.intentop = Provider.of<NivelesProvider>(context);
    homeController.numerosp = Provider.of<NumerosProvider>(context);


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
                        maxLength: homeController.intentop.getMaxLength,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        keyboardType: TextInputType.number,
                        controller: homeController.textFieldNumero,
                        decoration: InputDecoration(
                          labelText: homeController.intentop.getLenghNA,
                          hintText: "Numero",
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          suffixIconColor: fildcolor,
                          prefixIconColor: fildcolor,
                          fillColor: fildcolor,
                          focusColor: fildcolor,
                          hoverColor: fildcolor,
                          helperText: textHepl,
                          helperStyle: const TextStyle(fontSize: 6)
                        ),
                        textInputAction: TextInputAction.done,
                        cursorColor: fildcolor,
                        onSubmitted: (value) => homeController.onSaveTextFieldController(value,context),
                        onEditingComplete: (){
                          int valor = int.parse(homeController.textFieldNumero.text);
                          if(valor > homeController.intentop.getNumeroMaximo){
                            setState(() {
                              fildcolor = Colors.red;
                              textHepl = "Debes seleccionar un numero \n de ${homeController.intentop.obtenEjemplo()}";
                            });
                          }else{
                            setState(() {
                              fildcolor = Colors.black;
                              textHepl = "";
                            });
                          }
                        },
                      ),
                    ),
                     Expanded(
                      child: ListTile(
                        title: const Text("Intentos",textAlign: TextAlign.center,),
                        subtitle: Text(homeController.intentop.getIntentos,textAlign: TextAlign.center,),
                      )
                    )
                  ],
                ),
              ),
              Consumer<NumerosProvider>(
                builder: (context,nup, child){
                  return Row(
                    children: [
                      Expanded(child: NumeroContainer(titulo: "Mayor que", numeros: nup.getListNumMayor)),
                      Expanded(child: NumeroContainer(titulo: 'Menor que', numeros: nup.getListNumMenor,)),
                      Expanded(child: HistorialNumeroContainer(titulo: 'Historial', numeros: nup.getListHNumeros,))
                    ],
                  );
                }
              ),
              const Divider(
                height: 20,
              ),
              Consumer<NivelesProvider>(
                  builder: (context,np, child){
                    return Column(
                      children: [
                        const Text("Dificultad:"),
                        SlideButtonSteps(
                            title: np.getNiveles[np.nivelSelect.toInt()],
                            steps: np.getNiveles.length-1,
                            currentStep: np.nivelSelect,
                            change: (int value)=> homeController.onNivelChange(value),
                        ),
                      ],
                    );
                  }
              ),

            ],
          ),
        ),
          ConfettiWidget(
            confettiController: homeController.controllerConfetti,
            blastDirection: 0, // radial value - RIGHT
            particleDrag: 0.05, // apply drag to the confetti
            emissionFrequency: 0.05, // how often it should emit
            numberOfParticles: 20, // number of particles to emit
            gravity: 0.05, // gravity - or fall speed
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
}



PreferredSizeWidget buildBar(BuildContext context) {
  return AppBar(
    title: const Text("Adivina el Numero"),
    actions: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
    ],
  );
}
