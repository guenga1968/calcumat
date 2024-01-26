// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class RevoqueGrueso {
  final double superficie;
  final double espesor;
  final int desperdicio;
  final String titulo;

  RevoqueGrueso({
    required this.superficie,
    required this.espesor,
    required this.desperdicio,
    required this.titulo,
  });

  double get espesorM2 => espesor / 100;
  
  double get volumen => superficie * espesorM2;

  double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);

  Map<String, dynamic> tradicional() {
    final double cal =((volumen * (1 / 4.25)) * 560) * desperdicioEnValor;
    final double cemento =((volumen * (0.250 / 4.25)) * (50 / 0.035)) * desperdicioEnValor;
    final double arena = ((volumen * (3 / 4.25)) * 1.7) * desperdicioEnValor;

    return {
      'titulo': 'Revoque Grueso',
      'volumen': 'Vol. Mezcla: ${volumen.toPrecision(3)} m3.',
      'desperdicio': 'Desperdicio: $desperdicio %',
      'tipo': 'Método Tradicional',
      'mezcla': '1 Cal 1/4 Cemento 3 Arena',
      'cal':cal.toPrecision(2),
      'cemento': cemento.toPrecision(2),
      'arena': arena.toPrecision(3),
    };
  }

   Map<String, dynamic> cementoAlba() {
  
    final double alba = ((volumen * 247) /1) * desperdicioEnValor;
    final double arena = ((volumen * (5 / 6)) * 1.7) * desperdicioEnValor;

    return {
      'titulo': 'Revoque Grueso',
      'volumen':'Vol. Mezcla: ${volumen.toPrecision(3)} m3.',
      'desperdicio':'Desperdicio: $desperdicio %',
      'tipo': 'Cemento de Albañilería',
      'mezcla': '1 Cto.Albañilería 5 Arena',
      
      'Cto.Albañilería': alba.toPrecision(2),
      'arena': arena.toPrecision(3),
    };
  }
}
