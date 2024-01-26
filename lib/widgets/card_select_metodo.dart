import 'package:auto_size_text/auto_size_text.dart';
import 'package:calcumat/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardMetodoSelect extends StatelessWidget {
  CardMetodoSelect({super.key});
  final c = Get.find<Controller>();
 final myGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
      
    return Obx(() => Card(
      color: Theme.of(context).colorScheme.onSecondary,
      child: Column(
              children: [
                RadioListTile(
                  value: 1,
                  groupValue: c.metodo.value,
                  onChanged: (value) => c.metodo.value = value!,
                  title: AutoSizeText('Método Tradricional',  maxLines: 1, minFontSize: 8, group: myGroup,),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: c.metodo.value,
                  onChanged: (value) => c.metodo.value = value!,
            title:  AutoSizeText('Cemento de Albañilería',  maxLines: 1, minFontSize: 8, group: myGroup,),
          ),
        ],
      ),
    ),);
  }
}
