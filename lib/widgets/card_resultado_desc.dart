// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardDescripcion extends StatelessWidget {
   CardDescripcion({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;
 final mygroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
  List<String> datosFiltrados=[];
  data.forEach((key, value) {
      if (value is String) {
          datosFiltrados.add(value);
      }
    });


    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: datosFiltrados.length,
            itemBuilder: (context, index) {
              return AutoSizeText(datosFiltrados[index], textAlign: TextAlign.center,
              maxFontSize: 14,
               minFontSize: 8, maxLines:  1,group: mygroup);
            },
          ),
        ),
      ),
    );
  }

 
}
