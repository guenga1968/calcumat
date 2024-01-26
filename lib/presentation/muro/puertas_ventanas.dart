import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/text_form_alto_ancho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescontarAberturas extends StatelessWidget {
  DescontarAberturas({super.key});
  final _formKey = GlobalKey<FormState>();
  final c = Get.find<Controller>();
  final isPared = Get.arguments['isPared'];
  final superficie = Get.arguments['superficie'];
  final numeroPared = 0.obs;
  final List<int> muros = <int>[].obs;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBarCustom(route: '/muro-size', title: 'Tamaño Abertura', arguments: {'isPared': isPared},),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                AutoSizeText('Abertura: ${numeroPared.value + 1}',
                                    maxFontSize: 15),
                                ListTile(
                                  title: Form(
                                    key: _formKey,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    child: Column(
                                      children: [
                                        TextFormAltoAncho(tipo: 'Alto',
                                          onSaved: (value) {
                                            c.addAbertura(value);
                                          },
                                        ),
                                        const SizedBox(height: 8),
                                        TextFormAltoAncho(
                                          tipo: 'Ancho',
                                          onSaved: (value) {
                                            c.addAbertura(value);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                FilledButton.tonalIcon(
                                    label: const Text('Agregar Abertura'),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        _formKey.currentState!.reset();
                                        muros.add(numeroPared.value + 1);
                                        numeroPared.value += 1;
                                        FocusScope.of(context).unfocus();
                                        scrollController.animateTo(
                                          scrollController
                                              .position.maxScrollExtent,
                                          duration: const Duration(
                                              milliseconds: 500),
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
                    Obx(() => Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: numeroPared.value,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Text(
                                    'Abertura ${index + 1}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  title: AutoSizeText(
                                      "Alto: ${c.listadoAberturas[index * 2]} Ancho: ${c.listadoAberturas[index * 2 + 1]}",
                                      textAlign: TextAlign.center,
                                      maxFontSize: 15,
                                      maxLines: 1),
                                  trailing: IconButton(
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        if (index * 2 <
                                            c.listadoAberturas.length) {
                                          int end = (index * 2 + 2 <=
                                                  c.listadoAberturas.length)
                                              ? index * 2 + 2
                                              : c.listadoAberturas.length;
                                          c.listadoAberturas
                                              .removeRange(index * 2, end);
                                        }
                                        muros.removeAt(index);
                                        numeroPared.value -= 1;
                                      },
                                      icon: const Icon(Icons.delete)),
                                ),
                              );
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Obx(() => numeroPared.value > 0 ?
           FilledButton.tonalIcon(onPressed: (){
            final descuentoAberturas = c.descuentoSuperficie();
                final superficieMuro = superficie -descuentoAberturas;
                if(superficieMuro <= 0){
                  showDialog(context: context, builder: (context) =>  AlertDialog(
                    content: const Text('El descuento de Aberturas no puede ser mayor a la superficie de las Paredes.', 
                    textAlign: TextAlign.center),
                    actions: [IconButton(onPressed: (){
                      muros.clear();
                      numeroPared.value = 0;
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.cancel))],
                  ));
                }else{
               
                if(isPared == 'si'){
                    Get.toNamed('/muro-select', arguments: {'isPared': isPared, 'superficie': superficieMuro});
                } else {
                  Get.toNamed('/revoque', arguments: {'isPared': isPared, 'superficie': superficieMuro});
                }
                }
           }, 
           icon:const Icon(Icons.calculate_outlined), 
           label: const Text('Calcular'))
            :
            const SizedBox.shrink()
            ),
           
                )
                ) ;
  }
}