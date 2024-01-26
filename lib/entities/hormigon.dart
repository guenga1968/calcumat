import 'package:get/get.dart';

class Hormigon {
  final double ancho;
  final double profundidad;
  final double espesor;
  final int desperdicio;
  final String titulo;

  Hormigon({
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
    
    final double cemento = (((volumen * (1 / 7)) * (50 / 0.035)) * desperdicioEnValor);
    final double arena = (((volumen * (3 / 7)) * 1.7) * desperdicioEnValor);
    final double piedra = (((volumen * (3 / 7)) * 1.7) * desperdicioEnValor);
    return {
      'titulo': titulo,
      'volumen': 'Vol. Mezcla: ${volumen.toPrecision(3)} m3.',
      'desperdicio': 'Desperdicio: $desperdicio %',
      'tipo': 'Proporción',
      'mezcla': '1 Cemento 3 Arena 3 Piedra',
      'mezcla2': 'Hierros según cálculo',
  
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
      'piedra': piedra.toPrecision(3)
    };
  }
}
