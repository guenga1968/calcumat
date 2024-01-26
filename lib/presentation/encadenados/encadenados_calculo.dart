import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_desperdicio.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EncadenadosCalculo extends StatelessWidget {
  final arguments = Get.arguments;
  final _formKey = GlobalKey<FormState>();
  final largo = <double>[].obs;
  final numeroVigas = 0.obs;
  final List<int> vigas = <int>[].obs;
  final scrollController = ScrollController();
  final myGroup = AutoSizeGroup();

  EncadenadosCalculo({super.key});

  final List<String> encadenadosLista = [
    'Encadenado Pared 15cm.',
    'Encadenado Pared 20cm.',
    'Refuerzo Vertical Pared 15cm.'
  ];
  final valor = ''.obs;

  Widget dropdownButtom() {
    List<DropdownMenuItem<String>> itemsList = [];
    if (arguments['titulo'].toString().contains('Vigas y Col')) {
      itemsList = encadenadosLista
          .map((e) => DropdownMenuItem(value: e, child: AutoSizeText(e)))
          .toList();
      valor.value = encadenadosLista.first;
    } else if (arguments['titulo'].toString().contains('Viga de Fun')) {
      valor.value = arguments['titulo'];
      itemsList = [
        DropdownMenuItem(
            value: arguments['titulo'], child: AutoSizeText(arguments['titulo']))
      ];
    } else {
      valor.value = arguments['titulo'];
      itemsList = [
        DropdownMenuItem(
            value: arguments['titulo'], child: AutoSizeText(arguments['titulo']))
      ];
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey, width: 2, style: BorderStyle.solid)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Obx(() => DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            value: valor.value,
            items: itemsList,
            onChanged: (value) {
              valor.value = value.toString();
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBarCustom(route: '/home'),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  children: [
                    dropdownButtom(),
                    const SizedBox(height: 5),
                    DesperdicioWidget(),
                    Card(
                      color: Theme.of(context).colorScheme.onSecondary,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              AutoSizeText(
                                  'Elemento Estructural: ${numeroVigas.value + 1}',
                                  maxFontSize: 15),
                              const SizedBox(height: 5),
                              TextFormAltoAncho(
                                tipo: 'Largo',
                                onSaved: (value) {
                                  largo.add(double.parse(value!));
                                },
                              ),
                              const SizedBox(height: 5),
                              FilledButton.tonalIcon(
                                  label: const Text('Agregar'),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _formKey.currentState!.reset();
                                      vigas.add(numeroVigas.value + 1);
                                      numeroVigas.value += 1;
                                      FocusScope.of(context).unfocus();
                                      scrollController.animateTo(
                                        scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeOut,
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(() => ListView.builder(
                            controller: scrollController,
                            itemCount: numeroVigas.value,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Text(
                                    'E.Estructural: ${index + 1}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  title: AutoSizeText("${largo[index]} ml.",
                                      textAlign: TextAlign.center,
                                      maxFontSize: 15,
                                      maxLines: 1),
                                  trailing: IconButton(
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        vigas.removeAt(index);
                                        numeroVigas.value -= 1;
                                        largo.removeAt(index);
                                      },
                                      icon: const Icon(Icons.delete)),
                                ),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: numeroVigas.value > 0
                ? FilledButton.tonalIcon(
                    onPressed: () {
                    
                      double suma = largo.reduce(
                          (previousValue, element) => previousValue + element);
                      if (arguments['titulo'] ==
                          'Viga de Fundación 20x20 cm.') {
                        Get.toNamed('/resultadoCim', arguments: {
                          'largo': suma,
                          'titulo': arguments['titulo']
                        });
                      }
                      if (arguments['titulo'] == 'Pilotin 25cm. Ø') {
                        Get.toNamed('/resultadoCim', arguments: {
                          'largo': suma,
                          'titulo': arguments['titulo']
                        });
                      }

                      if (valor.value == 'Encadenado Pared 15cm.') {
                        Get.toNamed('/resultadoCim', arguments: {
                          'largo': suma,
                          'titulo': 'Encadenado Pared 15cm.'
                        });
                      }
                      if (valor.value == 'Encadenado Pared 20cm.') {
                        Get.toNamed('/resultadoCim', arguments: {
                          'largo': suma,
                          'titulo': 'Encadenado Pared 20cm.'
                        });
                      }
                      if (valor.value == 'Refuerzo Vertical Pared 15cm.') {
                        Get.toNamed('/resultadoCim', arguments: {
                          'largo': suma,
                          'titulo': 'Refuerzo Vertical Pared 15cm.'
                        });
                      }
                    },
                    icon: const Icon(Icons.calculate_outlined),
                    label: const Text('Calcular'))
                : const SizedBox.shrink()));
  }
}
