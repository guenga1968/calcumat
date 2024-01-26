import 'package:calcumat/controllers/controller.dart';
import 'package:calcumat/metodos/table_constructor.dart';
import 'package:calcumat/widgets/appbar_custom.dart';
import 'package:calcumat/widgets/enviar_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pedido extends StatefulWidget {
 const Pedido({super.key});

  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  final c = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(
        title: 'Pedido',
        route: '/home',
      ),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: TableConstructor(data:c.pedido )),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          if(value == 0){
            Get.toNamed('/home');
          }
          if(value == 1){
           c.pedido.clear();
          c.pedidos.value = false;
          setState(() {});
          }
        if(value == 2){
          showDialog(context: context, builder: (context) {
     String resultado = c.pedido.entries.map((e){
      
      String valor ='';
      if(e.key == 'arena' || e.key=='piedra' || e.key=='cascote') {
        valor = '${e.value} m3.';}
      if(e.key == 'cal'){
        valor = '${(e.value / 25).ceil()} bol.';
      }

      if(e.key =='cemento'){
        valor = '${(e.value/50).ceil()} bol.';
      }
       if( e.key.contains('Cto.A') ){
         valor = '${(e.value/40).ceil()} bol.';
       }
      if(e.key.contains('alamb')) valor = '${e.value} kg.';

      if(e.key.contains('hierr')){
        valor ='${(e.value/12).ceil()} Unid.';
      } 
      if(e.key.contains('Lad') || e.key.contains('L.Hu') || e.key.contains('B.Cer') || e.key.contains('B.Hor')) 
      {
        valor= '${e.value.ceil()} Unid.';
      }
      return'${e.key}= $valor';
      }).join(', ');

          return  EnviarWhatsapp(pedido: resultado );
        });
        }
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Borrar Pedido'),
           BottomNavigationBarItem(icon:  FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green), label: 'Enviar'),
      ])
      //  FilledButton.tonalIcon(
      //   
        
      //   }, icon:const Icon(Icons.delete), label:const Text('Borrar Pedido')),
    ));
  }
}
