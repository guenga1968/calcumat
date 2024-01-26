import 'package:flutter/material.dart';

class TableConstructor extends StatelessWidget {
  const TableConstructor({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

 

  @override
  Widget build(BuildContext context) {
     var sortedMap = Map.fromEntries(
  data.entries.toList()
    ..sort((e1, e2) => e1.key.compareTo(e2.key)),
);
    double columnSpacing;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 400) {
      columnSpacing = 40; // Espaciado predeterminado
    } else if (screenWidth > 250) {
      columnSpacing = 25.0;
    } else {
      columnSpacing = 8.0;
    }

    return Card(
      color: Theme.of(context).colorScheme.onSecondary,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 250),
        child: DataTable(
            columnSpacing: columnSpacing,
            dataTextStyle: TextStyle(
                fontSize:
                    (MediaQuery.of(context).size.width >= 400) ? 13 : 10),
            columns: const [
              DataColumn(label: Text('Material')),
              DataColumn(label: Text('Cant.')),
              DataColumn(label: Text('Med.')),
              DataColumn(label: Text('Frac.'))
            ],
            rows: sortedMap.entries.map((e) {
              String medida = 'm3.';
              String frac = '';
              if (e.key == 'cal') {
                medida = 'Kg.';
                frac = '${(e.value / 25).ceil().toString()} bol.';
              }
              if (e.key == 'cemento') {
                medida = 'Kg.';
                frac = '${(e.value / 50).ceil().toString()} bol.';
              }
              if (e.key == 'Cto.Albañilería') {
                medida = 'Kg.';
                frac = '${(e.value / 40).ceil().toString()} bol.';
              }
              if (e.key.contains('hierr')) {
                medida = 'ml.';
                frac = '${(e.value / 12).ceil().toString()} Un.';
              }
              if (e.key.contains('alambre')) {
                medida = 'Kg.';
              }
              if (e.key.contains('Ladrillo') ||
                  e.key.contains('B.Cer') ||
                  e.key.contains('Hueco') ||
                  e.key.contains('Hormi')) {
                medida = 'U.';
              }
    
              return DataRow(cells: [
                DataCell(Text(
                  e.key,
                  textAlign: TextAlign.start,
                )),
                DataCell(Container(
                    alignment: Alignment.centerRight,
                    child: Text('${e.value}'))),
                DataCell(Text(
                  medida,
                  textAlign: TextAlign.start,
                )),
                DataCell(Text(frac != '' ? frac : '',
                    textAlign: TextAlign.left)),
              ]);
            }).toList()),
      ),
    );
  }
}
