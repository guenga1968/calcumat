import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_ladrillo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuroSelect extends StatelessWidget {
  MuroSelect({super.key});
  final isPared = Get.arguments['isPared'];
  final superficie = Get.arguments['superficie'];
  final ScrollController _controller = ScrollController();
  final ScrollController _controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBarCustom(
                route: '/muro-size', arguments: {'isPared': isPared}),
            body: Center(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(children: [
                      Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Column(children: [
                           Container(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/ladrillo_comun.jpg'),
                                      ),
                                      SizedBox(width: 5),
                                      Text('Ladrillo Común',
                                          textAlign: TextAlign.center)
                                    ])),
                            Container(
                                padding: const EdgeInsets.all(2),
                                height: MediaQuery.of(context).size.height / 7,
                                child: Scrollbar(
                                    controller: _controller,
                                    thumbVisibility: true,
                                    child: ListView(
                                        controller: _controller,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          CardLadrillo(
                                              texto: 'Tabique de Canto',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Común',
                                                      'tipo':
                                                          'Tabique de Canto',
                                                      'size': {
                                                        'grueso': 5.0,
                                                        'tizon': 11.5,
                                                        'soga': 24.5
                                                      },
                                                      'junta': 1.5,
                                                      'tipoLadrillo':
                                                          'Ladrillo'
                                                    });
                                              }),
                                          CardLadrillo(
                                              texto: 'Pared de 15cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Común',
                                                      'tipo': "Pared de 15cms.",
                                                      'size': {
                                                        'grueso': 5.0,
                                                        'tizon': 11.5,
                                                        'soga': 24.5
                                                      },
                                                      'junta': 1.5,
                                                      'tipoLadrillo':
                                                          'Ladrillo'
                                                    });
                                              }),
                                          CardLadrillo(
                                              texto: 'Pared de 20cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Común',
                                                      'tipo': "Pared de 20cms.",
                                                      'size': {
                                                        'grueso': 5.0,
                                                        'tizon': 11.5,
                                                        'soga': 24.5
                                                      },
                                                      'junta': 1.5,
                                                      'tipoLadrillo':
                                                          'Ladrillo'
                                                    });
                                              }),
                                          CardLadrillo(
                                              texto: 'Pared de 30cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Común',
                                                      'tipo': "Pared de 30cms.",
                                                      'size': {
                                                        'grueso': 5.0,
                                                        'tizon': 11.5,
                                                        'soga': 24.5
                                                      },
                                                      'junta': 1.5,
                                                      'tipoLadrillo':
                                                          'Ladrillo'
                                                    });
                                              })
                                        ])))
                          ])),
                      Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Column(children: [
                            Container(
                             
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/ladrillo_hueco.jpg'),
                                      ),
                                      SizedBox(width: 5),
                                      Text('Ladrillo Hueco',
                                          textAlign: TextAlign.center)
                                    ])),
                            Container(
                                padding: const EdgeInsets.all(2),
                                height: MediaQuery.of(context).size.height / 7,
                                child: Scrollbar(
                                    controller: _controller2,
                                    thumbVisibility: true,
                                    child: ListView(
                                        controller: _controller2,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          CardLadrillo(
                                              texto: 'Tabique de 10cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Hueco',
                                                      'tipo':
                                                          "Tabique de 10cms.",
                                                      'size': {
                                                        'grueso': 8.0,
                                                        'tizon': 18.0,
                                                        'soga': 33.0
                                                      },
                                                      'junta': 1.0,
                                                      'tipoLadrillo': 'L.Hueco 8"'
                                                    });
                                              }),
                                          CardLadrillo(
                                              texto: 'Pared de 15cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Hueco',
                                                      'tipo':
                                                          "Tabique de 15cms.",
                                                      'size': {
                                                        'grueso': 12.0,
                                                        'tizon': 18.0,
                                                        'soga': 33.0
                                                      },
                                                      'junta': 1.0,
                                                      'tipoLadrillo':
                                                          'L.Hueco 12"'
                                                    });
                                              }),
                                          CardLadrillo(
                                              texto: 'Pared de 20cm.',
                                              onTap: () {
                                                Get.toNamed('/muro-calculo',
                                                    arguments: {
                                                      'superficie': superficie,
                                                      'clase': 'Ladrillo Hueco',
                                                      'tipo':
                                                          "Tabique de 20cms.",
                                                      'size': {
                                                        'grueso': 18.0,
                                                        'tizon': 18.0,
                                                        'soga': 33.0
                                                      },
                                                      'junta': 1.0,
                                                      'tipoLadrillo':
                                                          'L.Hueco 18"'
                                                    });
                                              })
                                        ])))
                          ])),
                      Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/bloque_ceramico.jpg'),
                                      ),
                                      SizedBox(width: 5),
                                      Text('Bloque Cerámico',
                                          textAlign: TextAlign.center)
                                    ])),
                            Container(
                                padding: const EdgeInsets.all(2),
                                height: MediaQuery.of(context).size.height / 7,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      CardLadrillo(
                                          texto: 'Pared de 15cm.',
                                          onTap: () {
                                            Get.toNamed('/muro-calculo',
                                                arguments: {
                                                  'superficie': superficie,
                                                  'clase': 'Bloque Cerámico',
                                                  'tipo': "Pared de 15cms.",
                                                  'size': {
                                                    'grueso': 12.0,
                                                    'tizon': 19.0,
                                                    'soga': 40.0
                                                  },
                                                  'junta': 1.0,
                                                  'tipoLadrillo':
                                                      'B.Cerámico 12"'
                                                });
                                          }),
                                      CardLadrillo(
                                          texto: 'Pared de 20cm.',
                                          onTap: () {
                                            Get.toNamed('/muro-calculo',
                                                arguments: {
                                                  'superficie': superficie,
                                                  'clase': 'Bloque Cerámico',
                                                  'tipo': "Pared de 20cms.",
                                                  'size': {
                                                    'grueso': 18.0,
                                                    'tizon': 19.0,
                                                    'soga': 40.0
                                                  },
                                                  'junta': 1.0,
                                                  'tipoLadrillo':
                                                      'B.Cerámico 18"'
                                                });
                                          })
                                    ]))
                          ])),
                      Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/bloque_hormigon.jpg'),
                                      ),
                                      SizedBox(width: 5),
                                      Text('Bloque de Hormigón',
                                          textAlign: TextAlign.center),
                                    ])),
                            Container(
                                padding: const EdgeInsets.all(2),
                                height: MediaQuery.of(context).size.height / 7,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      CardLadrillo(
                                          texto: 'Pared de 10cm.',
                                          onTap: () {
                                            Get.toNamed('/muro-calculo',
                                                arguments: {
                                                  'superficie': superficie,
                                                  'clase': 'Bloque de Hormigón',
                                                  'tipo': "Pared de 10cms.",
                                                  'size': {
                                                    'grueso': 9.0,
                                                    'tizon': 19.0,
                                                    'soga': 39.0
                                                  },
                                                  'junta': 1.0,
                                                  'tipoLadrillo':
                                                      'B.Hormigón 9"'
                                                });
                                          }),
                                      CardLadrillo(
                                          texto: 'Pared de 20cm.',
                                          onTap: () {
                                            Get.toNamed('/muro-calculo',
                                                arguments: {
                                                  'superficie': superficie,
                                                  'clase': 'Bloque de Hormigón',
                                                  'tipo': "Pared de 20cms.",
                                                  'size': {
                                                    'grueso': 19.0,
                                                    'tizon': 19.0,
                                                    'soga': 39.0
                                                  },
                                                  'junta': 1.0,
                                                  'tipoLadrillo':
                                                      'B.Hormigón 19"'
                                                });
                                          })
                                    ]))
                          ]))
                    ])))));
  }
}
