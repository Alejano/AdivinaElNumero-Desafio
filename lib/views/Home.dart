
import 'package:adivina_numero_desafio/providersController/NumerosProvider.dart';
import 'package:adivina_numero_desafio/providersController/NivelesProvider.dart';
import 'package:adivina_numero_desafio/widgets/NumeroContainer.dart';
import 'package:adivina_numero_desafio/widgets/SlideButtonSteps.dart';
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

  @override
  Widget build(BuildContext context) {
    homeController.intentop = Provider.of<NivelesProvider>(context);
    homeController.numerosp = Provider.of<NumerosProvider>(context);


    return Scaffold(
      appBar: buildBar(context),
      body: SingleChildScrollView(
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      controller: homeController.textFieldNumero,
                      decoration: InputDecoration(
                        labelText: homeController.intentop.getLenghNA,
                        hintText: "Numero",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        )
                      ),
                      onSubmitted: (value) => homeController.onSaveTextFieldController(value),
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
