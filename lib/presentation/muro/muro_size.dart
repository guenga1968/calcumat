import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuroSize extends StatelessWidget {
  MuroSize({super.key});
  final _formKey = GlobalKey<FormState>();
  final c = Get.find<Controller>();
  final isPared = Get.arguments['isPared'];
  final numeroPared = 0.obs;
  final List<int> muros = <int>[].obs;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(route: '/home', title: 'Tamaño Muro'),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AutoSizeText('Muro: ${numeroPared.value + 1}',
                              maxFontSize: 15),
                          const SizedBox(height: 5),
                          SizedBox(
                            child: Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  TextFormAltoAncho(
                                    tipo: 'Alto',
                                    onSaved: (value) {
                                      c.addPared(value);
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormAltoAncho(
                                    tipo: 'Ancho',
                                    onSaved: (value) {
                                      c.addPared(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          FilledButton.tonalIcon(
                              label: const Text('Agregar Muro'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _formKey.currentState!.reset();
                                  FocusScope.of(context).unfocus();
                                  muros.add(numeroPared.value + 1);
                                  numeroPared.value += 1;
                                  scrollController.animateTo(
                                    scrollController
                                        .position.maxScrollExtent,
                                    duration:
                                        const Duration(milliseconds: 10),
                                    curve: Curves.easeOut,
                                  );
                                }
                              },
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() => ListView.builder(
                      controller: scrollController,
                      // shrinkWrap: true,
                      itemCount: numeroPared.value,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Text(
                              'Muro ${index + 1}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            title: AutoSizeText(
                                "Alto: ${c.listadoParedes[index * 2]} Ancho: ${c.listadoParedes[index * 2 + 1]}",
                                textAlign: TextAlign.center,
                                maxFontSize: 15,
                                maxLines: 1),
                            trailing: IconButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (index * 2 < c.listadoParedes.length) {
                                    int end = (index * 2 + 2 <=
                                            c.listadoParedes.length)
                                        ? index * 2 + 2
                                        : c.listadoParedes.length;
                                    c.listadoParedes
                                        .removeRange(index * 2, end);
                                  }
                                  muros.removeAt(index);
                                  numeroPared.value -= 1;
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
     bottomNavigationBar: Obx(() => numeroPared.value > 0
          ? FilledButton.tonalIcon(
           
              onPressed: () {
                final superficie = c.calculoSuperficie();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('Desea descontar Aberturas?',
                          textAlign: TextAlign.center),
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actions: [
                        FilledButton(
                            onPressed: () {
                              Get.toNamed('/pv', arguments: {
                                'isPared': isPared,
                                'superficie': superficie
                              });
                            },
                            child: const Text('Si')),
                        FilledButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.tertiary)),
                            onPressed: () {
                              isPared == 'si'
                                  ? Get.toNamed('/muro-select', arguments: {
                                      'isPared': isPared,
                                      'superficie': superficie
                                    })
                                  : Get.toNamed('/revoque', arguments: {
                                      'isPared': isPared,
                                      'superficie': superficie
                                    });
                            },
                            child: const Text('No'))
                      ],
                    );
                  },
                );
              },
              label: const Text('Continuar'),
              icon: const Icon(Icons.check))
          : const SizedBox.shrink()),
    ));
  }
}
