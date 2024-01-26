// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class RevoqueFino {
  final double superficie;
  final double espesor;
  final int desperdicio;
  final String titulo;

  RevoqueFino({
    required this.superficie,
    required this.espesor,
    required this.desperdicio,
    required this.titulo,
  });

 double get espesorM2 => espesor / 100;
  
  double get volumen => superficie * espesorM2;

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    final double cal = ((volumen * (1 / 3.125)) * 560) * desperdicioEnValor;
    final double cemento =((volumen * (0.125 / 3.125)) * (50 / 0.035)) * desperdicioEnValor;
    final double arena = ((volumen * (2 / 3.125)) * 1.7) * desperdicioEnValor;

    return {
      'clase': 'Revoque Fino',
      'volumen': 'Vol. Mezcla: ${volumen.toPrecision(3)} m3.' ,
      'desperdicio': 'Desperdicio: $desperdicio %',
      'tipo': 'Proporción',
      'mezcla': '1 Cal 1/8 Cemento 2 Arena',
     
      'cal': cal.toPrecision(2),
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
    };
  }
}
