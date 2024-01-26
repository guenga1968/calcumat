 import 'package:get/get.dart';

class Carpeta {
  final double ancho;
  final double profundidad;
  final double espesor;
  final int desperdicio;
  final String titulo;

  Carpeta({
    required this.ancho,
    required this.profundidad,
    required this.espesor,
    required this.desperdicio,
    required this.titulo,
  });
  
  double get espesorM2 => espesor / 100;
  
  double get volumen => ancho * profundidad * espesorM2;

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    
    final double cemento = (((volumen * (1 / 4)) * (50 / 0.035)) * desperdicioEnValor);
    final double arena = (((volumen * (3 / 4)) * 1.7) * desperdicioEnValor);

    return {
      'clase':'Carpeta',
      'volumen': 'Cant.Mezcla: ${volumen.toPrecision(3)} m3.' ,
      'desperdicio':'Desperdicio: $desperdicio %' ,
      'metodo': 'Proporción',
      'mezcla': '1 Cemento 3 Arena',
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
    };
  }
}
