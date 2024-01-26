import 'package:get/get.dart';

class Controller extends GetxController {

final pedidos = false.obs;
final desperdicio = 0.obs;
final metodo = 1.obs;
final cardSelectedValue = ''.obs;
List<double>listadoParedes =<double>[];
List<double>listadoAberturas=<double>[];

void limpiarCardSelectedValue (){
  cardSelectedValue.value = '';
}
void addPared(value){
  listadoParedes.add(double.parse(value));
}
void addAbertura(value){
  listadoAberturas.add(double.parse(value));
}

// -------------------------------------- AGREGAR PEDIDOS ---------------------------------------
Map<String, dynamic> pedido ={};
void agregarPedido(Map<String, dynamic> data) {
  data.forEach((key, value) {
    if (value is num) {
      if (pedido.containsKey(key)) {
        pedido[key] =double.parse((pedido[key]! + value).toStringAsFixed(2));
      } else {
        pedido[key] = double.parse(value.toStringAsFixed(2));
      }
    }
  });
  pedidos.value = true;
}
//-----------------------------------------------

  double calculoSuperficie() {
    double suma = 0;
    for (int i = 0; i < listadoParedes.length; i += 2) {
      if (i + 1 < listadoParedes.length) {
        suma += listadoParedes[i] * listadoParedes[i + 1];
      }
    }
    listadoParedes.clear();
    return suma.toPrecision(3);
  }

  double descuentoSuperficie() {
    double suma = 0;
    for (int i = 0; i < listadoAberturas.length; i += 2) {
      if (i + 1 < listadoAberturas.length) {
        suma += listadoAberturas[i] * listadoAberturas[i + 1];
      }
    }
    listadoAberturas.clear();
    return suma.toPrecision(3);
  }
}