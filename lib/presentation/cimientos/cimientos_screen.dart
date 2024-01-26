import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cimientos extends StatelessWidget {
  const Cimientos({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBarCustom(route: '/home', title: 'Cimientos',),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Column(
            children: [
              const SizedBox(height: 20),
            InkWell(
              onTap: () {Get.toNamed('/cimientos-calc',arguments: {'titulo':'Hormigón de Cascote'});},
              child:  Card(
                color: Theme.of(context).colorScheme.onPrimary,
                child: const SizedBox(
                  height: 100,
                  child: Center(child: Text('Cimiento Corrido de Hormigón de Cascote', textAlign: TextAlign.center,))),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {Get.toNamed('/encadenados',arguments:{'titulo':'Viga de Fundación 20x20 cm.'});},
              child:  Card(
                color:  Theme.of(context).colorScheme.onSecondary,
                child:  const SizedBox(
                  height: 100,
                  child: Center(child: Text('Viga de Fundación 20x20 cm.', textAlign: TextAlign.center,))),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
               onTap: () {Get.toNamed('/encadenados',arguments:{'titulo':'Pilotin 25cm. Ø'});},
              child:  Card(
                color: Theme.of(context).colorScheme.onTertiary,
                child: const SizedBox(
                  height: 100,
                  child: Center(child: Text('Pilotin 25cm. Ø', textAlign: TextAlign.center,))),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}