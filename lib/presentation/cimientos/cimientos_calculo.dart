import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_desperdicio.dart';
import 'package:calcumat/widgets/card_select_metodo.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CimientosCalculo extends StatelessWidget {
  CimientosCalculo({super.key});
  final c = Get.find<Controller>();
  final formKey = GlobalKey<FormState>();
  final arguments = Get.arguments;
  final profundidad = 0.0.obs;
  final ancho = 0.0.obs;
  final espesor = 0.0.obs;
  final selectedTipo = ''.obs;
  final myGroup = AutoSizeGroup();
  final carpetaContrapiso = 1.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          route: '/home',
          title: arguments['titulo'],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Obx(() {
                  return Column(
                    children: [
                    
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                TextFormAltoAncho(
                                  tipo: 'Ancho',
                                  onSaved: (value) {
                                    profundidad.value = double.parse(value!);
                                  },
                                ),
                                const SizedBox(height: 5),
                                TextFormAltoAncho(
                                  tipo: 'Profundidad',
                                  onSaved: (value) {
                                    ancho.value = double.parse(value!);
                                  },
                                ),
                                const SizedBox(height: 5),
                                TextFormAltoAncho(
                                  tipo: 'Espesor',
                                  onSaved: (value) {
                                    espesor.value = double.parse(value!);
                                  },
                                  onChanged: (value) {
                                    Timer(const Duration(seconds: 1), () {
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                 
                      if (arguments['titulo'] == 'Carpeta y Contrapiso') ...[
                        Card(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: Column(
                            children: [
                              RadioListTile(
                                  value: 1,
                                  groupValue: carpetaContrapiso.value,
                                  onChanged: (value) {
                                    carpetaContrapiso.value = value!;
                                  },
                                  title: AutoSizeText('Carpeta',
                                      maxLines: 1,
                                      minFontSize: 8,
                                      group: myGroup)),
                              RadioListTile(
                                  value: 2,
                                  groupValue: carpetaContrapiso.value,
                                  onChanged: (value) {
                                    carpetaContrapiso.value = value!;
                                  },
                                  title: AutoSizeText('Contrapiso',
                                      maxLines: 1,
                                      minFontSize: 8,
                                      group: myGroup)),
                            ],
                          ),
                        )
                      ],

                      // Aca tarjeta MetodoSelect si es Contrapiso u Hormigon de Cascote
                      if (carpetaContrapiso.value == 2 ||
                          arguments['titulo'] == 'Hormigón de Cascote') ...[
                        CardMetodoSelect(),
                      ],

                      DesperdicioWidget(),
                    ],
                  );
                })),
          ),
        ),
        bottomNavigationBar: FilledButton.tonalIcon(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String titulo = '';
                if (arguments['titulo'] == 'Carpeta y Contrapiso') {
                  if (carpetaContrapiso.value == 1) {
                    titulo = 'Carpeta';
                  }
                  if (carpetaContrapiso.value == 2) {
                    titulo = 'Contrapiso';
                  }
                } else {
                  titulo = arguments['titulo'];
                }
                formKey.currentState!.save();
                c.limpiarCardSelectedValue();
                Get.toNamed('/resultadoCim', arguments: {
                  'profundidad': profundidad.value,
                  'ancho': ancho.value,
                  'espesor': espesor.value,
                  'titulo': titulo
                });
              }
            },
            icon: const Icon(Icons.calculate_outlined),
            label: const Text('Calcular')),
      ),
    );
  }
}
