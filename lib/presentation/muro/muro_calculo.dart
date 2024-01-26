import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_desperdicio.dart';
import 'package:calcumat/widgets/card_select_metodo.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuroCalculo extends StatelessWidget {
  MuroCalculo({super.key});
  final c = Get.find<Controller>();
  final myGroup = AutoSizeGroup();
  final arguments = Get.arguments;
  final grueso = 0.0.obs;
  final tizon = 0.0.obs;
  final soga = 0.0.obs;
  final junta = 0.0.obs;

  String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}

  @override
  Widget build(BuildContext context) {
    grueso.value = arguments['size']['grueso'];
    tizon.value = arguments['size']['tizon'];
    soga.value = arguments['size']['soga'];
    junta.value = arguments['junta'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          title: 'Muro ${arguments['clase']}',
          route: '/muro-select',
          arguments: {'superficie': arguments['superficie']},
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Card(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          AutoSizeText(arguments['clase'],
                              textAlign: TextAlign.center,
                              maxFontSize: 18,
                              minFontSize: 8),
                          AutoSizeText(arguments['tipo'],
                              textAlign: TextAlign.center,
                              maxFontSize: 18,
                              minFontSize: 8),
                          Obx(() => GestureDetector(
                             onTap: () {
                                          editSizeLadrillo(context);
                                        },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  AutoSizeText(
                                      'Tamaño: ${format(grueso.value)}:${format(tizon.value)}:${format(soga.value)} cms.',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      group: myGroup),
                                  Icon(Icons.edit,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                          size: 15),
                                ]),
                          )),
                          Obx(() => GestureDetector(
                             onTap: () {
                                          editJunta(context);
                                        },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  AutoSizeText(
                                      'Espesor Junta: ${junta.value} cm.',
                                      textAlign: TextAlign.center,
                                      minFontSize: 8,
                                      group: myGroup),
                                  Icon(Icons.edit,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface, size: 15,),
                                ]),
                          ))
                        ],
                      ),
                    ),
                  ),
                  CardMetodoSelect(),
                  DesperdicioWidget(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            onTap: (value) {
              value == 0
                  ? Get.toNamed('/muro-select',
                      arguments: {'superficie': arguments['superficie']})
                  : Get.toNamed('/resultadoCim', arguments: {
                      'titulo': 'Muro',
                      'grueso': grueso.value,
                      'tizon': tizon.value,
                      'soga': soga.value,
                      'tipo': arguments['tipo'],
                      'junta': junta.value,
                      'clase': arguments['clase'],
                      'superficie': arguments['superficie'],
                      'desperdicio': c.desperdicio.value,
                      'tipoLadrillo':arguments['tipoLadrillo']
                    });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back), label: 'Volver'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate_outlined), label: 'Calcular')
            ]),
      ),
    );
  }

  Future<dynamic> editSizeLadrillo(BuildContext context) {
    final formEditLadrillo = GlobalKey<FormState>();
    return showDialog(
      barrierColor: Theme.of(context).colorScheme.background,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Form(
            key: formEditLadrillo,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset('assets/caras_ladrillo.jpg',
                          width: 150, height: 100, fit: BoxFit.cover)),
                  const SizedBox(height: 5),
                  TextFormAltoAncho(
                    initialValue: grueso.value.toString(),
                    tipo: 'Grueso',
                    onSaved: (value) {
                      grueso.value = double.parse(value!).toPrecision(1);
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormAltoAncho(
                    initialValue: tizon.value.toString(),
                    tipo: 'Tizón',
                    onSaved: (value) {
                      tizon.value = double.parse(value!).toPrecision(1);
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormAltoAncho(
                    initialValue: soga.value.toString(),
                    tipo: 'Soga',
                    onSaved: (value) {
                      soga.value = double.parse(value!).toPrecision(1);
                    },
                  )
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel)),
            IconButton(
                onPressed: () {
                  if (formEditLadrillo.currentState!.validate()) {
                    formEditLadrillo.currentState!.save();
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.check))
          ],
        );
      },
    );
  }

  Future<dynamic> editJunta(BuildContext context) {
    final formEditJunta = GlobalKey<FormState>();
    return showDialog(
      barrierColor: Theme.of(context).colorScheme.background,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Form(
            key: formEditJunta,
            child: IntrinsicHeight(
              child: TextFormAltoAncho(
                tipo: 'Espesor',
                initialValue: junta.value.toString(),
                onSaved: (value) {
                  junta.value = double.parse(value!).toPrecision(1);
                },
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel)),
            IconButton(
                onPressed: () {
                  if (formEditJunta.currentState!.validate()) {
                    formEditJunta.currentState!.save();
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.check))
          ],
        );
      },
    );
  }
}
