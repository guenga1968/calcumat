import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_desperdicio.dart';
import 'package:calcumat/widgets/card_select_metodo.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Revoque extends StatelessWidget {
  Revoque({super.key});
  final c = Get.find<Controller>();
  final formKey = GlobalKey<FormState>();
  final espesor = 0.0.obs;
  final tipoValue = 1.obs;
  final superficie = Get.arguments['superficie'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          route: '/home',
          arguments: const {'isPared': '0'},
          title: 'Revoques',
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Obx(() => Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Superficie a cubrir: $superficie mts2.'),
                              ),
                              TextFormAltoAncho(
                                tipo: 'Espesor',
                                onSaved: (value) {
                                   espesor.value = double.parse(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Column(
                          children: [
                            RadioListTile(
                                value: 1,
                                groupValue: tipoValue.value,
                                onChanged: (value) {
                                  tipoValue.value = value!;
                                  FocusScope.of(context).unfocus();
                                },
                                title: const Text('Revoque Fino')),
                            RadioListTile(
                                value: 2,
                                groupValue: tipoValue.value,
                                onChanged: (value) {
                                  tipoValue.value = value!;
                                FocusScope.of(context).unfocus();
                                },
                                title: const Text('Revoque Grueso')),
                          ],
                        ),
                      ),
                      if (tipoValue.value == 2) ...[CardMetodoSelect()],
                      DesperdicioWidget(),
                      const SizedBox(height: 10),
                    ],
                  )),
            ),
          ),
        ),
        bottomNavigationBar: FilledButton.tonalIcon(onPressed: (){
               if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  
                  if (tipoValue.value == 1) {
                    Get.toNamed('/resultadoCim', arguments: {
                      'superficie': superficie,
                      'espesor': espesor.value,
                      'titulo': 'Revoque Fino'
                    });
                  }
                  if (tipoValue.value == 2) {
                    Get.toNamed('/resultadoCim', arguments: {
                      'superficie': superficie,
                      'espesor': espesor.value,
                      'titulo': 'Revoque Grueso'
                    });
                  }
                }
        }, icon: const Icon(Icons.calculate_outlined), 
        label: const Text('Calcular'))
      ),
    );
  }
}
