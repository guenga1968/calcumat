
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesperdicioWidget extends StatelessWidget {
  DesperdicioWidget({super.key});
  final c = Get.find<Controller>();
 final myGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Theme.of(context).colorScheme.onTertiary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
             const Padding(
              padding: EdgeInsets.all(8.0),
              child: AutoSizeText('Calcular con Desperdicio:',maxFontSize: 15, minFontSize: 7,)
            ),
            Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 0,
                              groupValue: c.desperdicio.value,
                              onChanged: (value) {
                                c.desperdicio.value = value!;
                              }),
                            AutoSizeText('0%',maxFontSize: 12, minFontSize: 7, group: myGroup),
                            
                            Radio(
                              value: 5,
                              groupValue: c.desperdicio.value,
                              onChanged: (value) {
                                c.desperdicio.value = value!;
                              },),
                              AutoSizeText('5%',minFontSize: 7, group: myGroup),
                             
                            Radio(
                  value: 10,
                  groupValue: c.desperdicio.value,
                  onChanged: (value) {
                    c.desperdicio.value = value!;
                  }),
                AutoSizeText('10%',minFontSize: 7, group: myGroup),
                Radio(
                  value: 15,
                  groupValue: c.desperdicio.value,
                  onChanged: (value) {
                    c.desperdicio.value = value!;
                  }),
                 AutoSizeText('15%',minFontSize: 7, group: myGroup)
                
              ],
            ),)
          ],
        ),
    
    );
  }
}
