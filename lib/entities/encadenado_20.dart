import 'package:get/get.dart';

class Encadenado20 {
  final double largo;
  final int desperdicio;
  final String titulo;

  Encadenado20({
    required this.largo,
    required this.desperdicio,
    required this.titulo,
  });

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    
    final double cemento =(largo * 9)*desperdicioEnValor;
    final double arena = (largo * 0.020)*desperdicioEnValor;
    final double piedra =  (largo * 0.020)*desperdicioEnValor;
    final double hierro8 =  (largo * 4)*desperdicioEnValor;
    final double hierro4 = (largo * 3)*desperdicioEnValor;

    return {
      'clase': 'Encadenado 15x20 cm.',
      'largo': 'Longitud: $largo ml',
       'desperdicio': 'Desperdicio: $desperdicio %',
      'tipo': 'Proporción',
      'mezcla': "1 Cemento 3 Arena 3 Piedra",
      'mezcla2': "Hierro 8° Hierro 4°",
     
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
      'piedra': piedra.toPrecision(3),
      "hierro 8°": hierro8.toPrecision(2),
      'hierro 4°': hierro4.toPrecision(2),
    };
  }
}