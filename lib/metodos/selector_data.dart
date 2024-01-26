import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/entities/entities.dart';
import 'package:calcumat/entities/ladrillo.dart';
import 'package:get/get.dart';

Map<String,dynamic> selectorData (Map<String,dynamic>arguments ){
final c = Get.find<Controller>();
Map<String,dynamic> data={};

if(arguments['titulo'] == 'Carpeta'){
 data= Carpeta(ancho: arguments['ancho'], profundidad: arguments['profundidad'], espesor: arguments['espesor'], 
  desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Contrapiso' || arguments['titulo'] == 'Hormigón de Cascote'){
  c.metodo.value == 1 ?
 data=  ContrapisoHormigonCascote(ancho: arguments['ancho'],profundidad: arguments['profundidad'], espesor: arguments['espesor'],
   desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional()
   :
 data= ContrapisoHormigonCascote(ancho: arguments['ancho'],profundidad: arguments['profundidad'], espesor: arguments['espesor'],
   desperdicio: c.desperdicio.value, titulo: arguments['titulo']).cementoAlba();
}

if(arguments['titulo'] == 'Encadenado Pared 15cm.'){
 data= Encadenado15(largo: arguments['largo'], desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Encadenado Pared 20cm.'){
 data= Encadenado20(largo: arguments['largo'], desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Hormigón'){
data=  Hormigon(ancho: arguments['ancho'], profundidad: arguments['profundidad'], espesor: arguments['espesor'],
   desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Pilotin 25cm. Ø'){
data = Pilotin(largo: arguments['largo'], desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Refuerzo Vertical Pared 15cm.'){
data =  RefuerzoVertical(largo: arguments['largo'], desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Revoque Fino'){
data =  RevoqueFino(superficie: arguments['superficie'], espesor: arguments['espesor'],
 desperdicio: c.desperdicio.value, titulo: 'Revoque Fino').tradicional();
}

 if(arguments['titulo'] == 'Revoque Grueso'){
  c.metodo.value == 1 ?
 data = RevoqueGrueso(superficie: arguments['superficie'], espesor: arguments['espesor'],
  desperdicio: c.desperdicio.value, titulo: 'Revoque Grueso').tradicional()
   :
 data =  RevoqueGrueso(superficie: arguments['superficie'], espesor: arguments['espesor'],
  desperdicio: c.desperdicio.value, titulo: 'Revoque Grueso').cementoAlba();
}

if(arguments['titulo'] == 'Viga de Fundación 20x20 cm.'){
 data = VigaFundacion(largo: arguments['largo'], desperdicio: c.desperdicio.value, titulo: arguments['titulo']).tradicional();
}

if(arguments['titulo'] == 'Muro'){
  c.metodo.value == 1 ?
  data = Ladrillo(titulo:arguments['titulo'], clase: arguments['clase'], tipo: arguments['tipo'], superficie: arguments['superficie'], 
  grueso: arguments['grueso'], tizon:arguments['tizon'], soga:arguments['soga'], tipoLadrillo: arguments['tipoLadrillo'],
  junta:arguments['junta'], desperdicio: c.desperdicio.value , ).tradicional()
  :
   data = Ladrillo(titulo: arguments['titulo'],  clase: arguments['clase'], tipo: arguments['tipo'], superficie: arguments['superficie'], 
  grueso: arguments['grueso'], tizon:arguments['tizon'], soga:arguments['soga'], tipoLadrillo: arguments['tipoLadrillo'],
  junta:arguments['junta'], desperdicio: c.desperdicio.value).cementoAlba();}
 
  return data;
}

