// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';

class Ladrillo {
final String titulo;
final String clase;
final String tipoLadrillo;
final String tipo;
final double superficie;
final double grueso;
final double tizon;
final double soga;
final double junta;
final int desperdicio;
  Ladrillo({
    required this.titulo,
    required this.clase,
    required this.tipoLadrillo,
    required this.tipo,
    required this.superficie,
    required this.grueso,
    required this.tizon,
    required this.soga,
    required this.junta,
    required this.desperdicio,
  });

 double get juntaM2 => junta / 100;

 double get desperdicioEnValor => desperdicio == 0 ? 1 : 1 + (desperdicio / 100);
 String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
double get gruesoM2 => grueso/100;
double get tizonM2 => tizon/100;
double get sogaM2 => soga/100;
 
 double get totalLadrillo {
 if(clase == 'Ladrillo Común'){
  if(tipo == 'Pared de 15cms.'){
    return  superficie / ((juntaM2 + sogaM2) * (juntaM2 + gruesoM2));
  }
  if(tipo == 'Pared de 20cms.'){
    return (superficie / ((juntaM2 + sogaM2) * (juntaM2 + gruesoM2))) + (superficie /((juntaM2 + sogaM2) * (juntaM2 + tizonM2)));
  }
  if(tipo == 'Pared de 30cms.'){
    return  (superficie / ((juntaM2 + sogaM2) * (juntaM2 + gruesoM2))) +
           (superficie / ((juntaM2 + sogaM2) * (juntaM2 + gruesoM2)));
  }
 }
 
 return superficie /((juntaM2 + sogaM2) * (juntaM2 + tizonM2));
 } 
  
  double get totalMezcla {

 if(clase == 'Ladrillo Común'){
  if(tipo == 'Pared de 15cms.'){
    return  (superficie * tizonM2) - (sogaM2 * tizonM2 * gruesoM2 * totalLadrillo);
  }
  if(tipo == 'Pared de 20cms.'){
    return  (superficie * (tizonM2 + juntaM2 + gruesoM2)) -
            (totalLadrillo * sogaM2 * tizonM2 * gruesoM2);
  }
  if(tipo == 'Pared de 30cms.'){
    return  (superficie * sogaM2) - (totalLadrillo * sogaM2 * tizonM2 * gruesoM2);
  }
 }
 return  (superficie * gruesoM2) - (sogaM2 * tizonM2 * gruesoM2 * totalLadrillo);
 } 


Map<String, dynamic> tradicional(){
  final cal = ((totalMezcla * (1 / 4.5)) * 560) * desperdicioEnValor;
  final cemento = ((totalMezcla * (0.5 / 4.5)) * (50 / 0.035)) * desperdicioEnValor;
  final arena = ((totalMezcla * (3 / 4.5)) * 1.7) * desperdicioEnValor;
 
  return {
    'titulo':'Muro con $clase',
    'medida':'(Medida: ${format(grueso)}:${format(tizon)}:${format(soga)} cm.)',
    'tipo':tipo,
    'superficie': 'Superficie: ${superficie.toPrecision(2)} m2.- Vol.Mezcla: ${totalMezcla.toPrecision(2)} m3.',
    'junta': 'Junta: $junta cm. - Desperdicio: $desperdicio %',
    'metodo':' Método Tradicional',
    'mezcla':'1 Cal : 1/2 Cemento : 3 Arena',
    'cal':cal.toPrecision(2),
    'cemento':cemento.toPrecision(2),
    'arena':arena.toPrecision(3),
    tipoLadrillo: totalLadrillo.ceil()
  };
}


Map<String, dynamic> cementoAlba(){

final alba = ((totalMezcla * 189) / 1) * desperdicioEnValor;
final arena =((totalMezcla * (5/ 6)) * 1.7) * desperdicioEnValor;

  return {
    'titulo':'Muro con $clase',
    'medida':'(Medida: ${format(grueso)}:${format(tizon)}:${format(soga)} cm.)',
    'tipo':tipo,
    'superficie': 'Superficie: ${superficie.toPrecision(2)} m2. - Vol.Mezcla:${totalMezcla.toPrecision(2)} m3.',
    'junta': 'Junta: $junta cm. - Desperdicio: $desperdicio %',
    'metodo':'Con Cto.de Albañilería',
    'mezcla': '1 Cto.Albañilería : 5 Arena',
    'Cto.Albañilería':alba.toPrecision(2),
    'arena': arena.toPrecision(3),
    tipoLadrillo: totalLadrillo.ceil()
  };
}


}
