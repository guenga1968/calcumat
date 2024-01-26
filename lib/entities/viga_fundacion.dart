import 'package:get/get.dart';

class VigaFundacion {
  final double largo;
  final int desperdicio;
  final String titulo;

  VigaFundacion({
    required this.largo,
    required this.desperdicio,
    required this.titulo,
  });

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    
    final double cemento = ((largo * 12.00) * desperdicioEnValor);
    final double arena = ((largo * 0.026) * desperdicioEnValor);
    final double piedra = ((largo * 0.026) * desperdicioEnValor);
    final double hierro10 = ((largo * 4.00) * desperdicioEnValor);
    final double hierro4 = ((largo * 3.50) * desperdicioEnValor);
    final double alambre =((largo * 0.150) * desperdicioEnValor);
    return {
      'clase': 'Viga de Fundación 20x20cm.',
      'largo': 'Longitud: $largo ml.',
      'desperdicio':'Desperdicio: $desperdicio %',
      'metodo': 'Proporción',
      'mezcla': "1 Cemento 3 Arena 3 Piedra" ,
      "mezcla2":  "Hierro 10° Hierro 4° Alambre Negro",
      
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
      'piedra': piedra.toPrecision(3),
      "hierro 10°": hierro10.toPrecision(2),
      'hierro 4°': hierro4.toPrecision(2),
      'alambre': alambre.toPrecision(2)
    };
  }
}
