// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EnviarWhatsapp extends StatefulWidget {
  const EnviarWhatsapp({
    Key? key,
    required this.pedido,
  }) : super(key: key);
  final String pedido;
  @override
  State<EnviarWhatsapp> createState() => _EnviarWhatsappState();
}

class _EnviarWhatsappState extends State<EnviarWhatsapp> {
final _formKey = GlobalKey<FormState>();
String telefono ='549';

void sendWhatsAppMessage(String phoneNumber, String message) async {
  final Uri phone =Uri.parse(phoneNumber);
 final Uri mensaje = Uri.parse(message);
  var whatsappUrl =Uri.parse("https://wa.me/$phone?text=$mensaje") ;
    await launchUrl(whatsappUrl);
}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key:_formKey,
        autovalidateMode:AutovalidateMode.onUserInteraction,
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration:  InputDecoration(
            label: const Text('Teléfono'),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(15)
            )
          ),
       validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa un valor';
    } else if (value.length < 8) {
      return 'El número debe tener al menos 10 caracteres';
    }
    return null;
  },
       onSaved: (newValue) {
         telefono = telefono + newValue.toString();
       },   
          
        ),
      ),
    actions: [
      IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.cancel)),
       IconButton(onPressed: () {
        if(_formKey.currentState!.validate()){
          _formKey.currentState!.save();
          FocusScope.of(context).unfocus();
        sendWhatsAppMessage(telefono, widget.pedido.toString());
        Navigator.pop(context);
        
        }
       }, icon:const Icon(Icons.send)),
    ],
    );
  }
}