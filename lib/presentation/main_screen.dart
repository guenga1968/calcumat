import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final t = Get.find<ThemeController>();
  final c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CircleAvatar(
                radius:15,
                backgroundImage:AssetImage('assets/sketch.png'),
              ),
              SizedBox(width: 5),
              AutoSizeText(
                'CalcuMat',
                maxFontSize: 15, minFontSize: 8 ,maxLines: 1
              )
            ],
          ),
          actions: [
            Obx(() => c.pedidos.value == true
                ? Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: IconButton(
                       
                        iconSize: 30,
                        onPressed: () {
                          Get.toNamed('/pedido');
                        },
                        icon:
                            const Icon(Icons.create_new_folder_rounded)),
                  )
                : const SizedBox.shrink()),
            Obx(() => IconButton(
                  icon: t.isDarkTheme.value ?  const Icon(Icons.wb_sunny): const Icon(Icons.nights_stay),
                  onPressed: () {
                    t.changeTheme();
                  },
                )),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Column(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/muro-size', arguments: {'isPared': 'si'});
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/brickwall.png',
                          ),
                        ),
                        title: Text('Muros'),
                        subtitle: AutoSizeText(
                          'Ladrillos: Comunes - Cerámicos - Cemento',
                          maxFontSize: 15,
                          minFontSize: 8,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/muro-size', arguments: {'isPared': 'no'});
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/revoques.png'),
                        ),
                        title: Text('Revoques'),
                        subtitle: AutoSizeText(
                          'Revoques Finos - Gruesos.',
                          maxFontSize: 15,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/cimientos-calc',arguments: {'titulo':'Carpeta y Contrapiso'});
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/construction.png'),
                        ),
                        title: Text('Carpeta y Contrapiso'),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/cimientos');
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/wheelbarrow.png'),
                        ),
                        title: Text('Cimientos'),
                        subtitle: AutoSizeText(
                          'Hormigón de Cascote - Viga de Fundación - Pilotines',
                          maxFontSize: 15,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/encadenados', arguments: {'titulo':'Vigas y Columnas'});
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/beam.png'),
                        ),
                        title: Text('Vigas y Columnas'),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/cimientos-calc', arguments: {'titulo':'Hormigón'});
                      },
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/mixer-truck.png'),
                        ),
                        title: Text('Hormigón Armado'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
