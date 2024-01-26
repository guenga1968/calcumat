import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/metodos/selector_data.dart';
import 'package:calcumat/metodos/table_constructor.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/card_resultado_desc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resultados extends StatelessWidget {
  Resultados({super.key});
  final c = Get.find<Controller>();
  final Map<String,dynamic> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {

    var data = selectorData(arguments);

    Map<String, dynamic> datosFiltrados = {};

    data.forEach((key, value) {
      if (value is num) {
       
          datosFiltrados[key] = value;
        
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBarCustom(
          route: '/home',
          title: 'Resultado',
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CardDescripcion(data:data ),
                TableConstructor(data: datosFiltrados)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
                currentIndex: 0,
                onTap: (value) {
                  if (value == 1) {
                    c.agregarPedido(datosFiltrados);
                    Get.toNamed('/pedido');
                  }
                  if (value == 0) Get.toNamed('/home');
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Inicio'),
                  BottomNavigationBarItem(icon: Icon(Icons.create_new_folder_rounded), label: 'Agregar a Pedido'),
                ])),
    );
  }
}
