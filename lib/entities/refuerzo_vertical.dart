import 'package:get/get.dart';

class RefuerzoVertical {
  final double largo;
  final int desperdicio;
  final String titulo;

  RefuerzoVertical({
    required this.largo,
    required this.desperdicio,
    required this.titulo,
  });

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    
    final double cemento =(largo * 7.50)*desperdicioEnValor;
    final double arena = (largo * 0.016)*desperdicioEnValor;
    final double piedra =  (largo * 0.016)*desperdicioEnValor;
    final double hierro10 =  (largo * 6)*desperdicioEnValor;
    final double hierro4 =(largo * 3)*desperdicioEnValor;

    return {
      'titulo': 'Refuerzo Vertical Pared 15"',
      'largo': 'Longitud: $largo ml.',
      'desperdicio':'Desperdicio: $desperdicio %',
      'tipo': 'Proporción',
      'mezcla': "1 Cemento 3 Arena 3 Piedra",
      'mezcla2': "Hierro 10° Hierro 4°",
      
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
      'piedra': piedra.toPrecision(3),
      "hierro 10°": hierro10.toPrecision(2),
      'hierro 4°': hierro4.toPrecision(2),
    };
  }
}