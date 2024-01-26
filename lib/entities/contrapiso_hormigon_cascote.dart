// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class ContrapisoHormigonCascote {
  final double ancho;
  final double profundidad;
  final double espesor;
  final int desperdicio;
  final String titulo;

  ContrapisoHormigonCascote({
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
    final double cal = (((volumen * (1 / 11.25)) * 560) * desperdicioEnValor);
    final double cemento = (((volumen * (0.250 / 11.25)) * (50 / 0.035)) * desperdicioEnValor);
    final double arena = (((volumen * (4 / 11.25)) * 1.7) * desperdicioEnValor);
    final double cascote = (((volumen * (6 / 11.25)) * 1.7) * desperdicioEnValor);

    return {
      'clase': titulo,
      'volumen':'Cant.Mezcla: ${volumen.toPrecision(3)} m3.' ,
      'desperdicio': 'Desperdicio: $desperdicio %',
      'metodo': 'Tradicional',
      'mezcla': '1 Cal 1/4 Cemento 4 Arena 6 Cascote',
      'cal': cal.toPrecision(2),
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
      'cascote': cascote.toPrecision(3)
    };
  }

  Map<String, dynamic> cementoAlba() {
    final double alba = (((volumen * 105) / 1) * desperdicioEnValor);
    final double arena = (((volumen * (4 / 13)) * 1.7) * desperdicioEnValor);
    final double cascote = (((volumen * (8 / 13)) * 1.7) * desperdicioEnValor);

    return {
      'clase': titulo,
      'volumen':'Cant.Mezcla: ${volumen.toPrecision(3)} m3.' ,
      'desperdicio': 'Desperdicio: $desperdicio %',
      'metodo': 'Con Cto.Albañilería',
      'mezcla': '1 Cto.Albañilería 4 Arena 8 Cascote',
      'Cto.Albañilería': alba.toPrecision(2),
      'arena': arena.toPrecision(3),
      'cascote': cascote.toPrecision(3)
    };
  }
}
