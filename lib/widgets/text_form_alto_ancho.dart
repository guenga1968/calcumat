// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormAltoAncho extends StatelessWidget {
  final String tipo;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const TextFormAltoAncho({
    Key? key,
    required this.tipo,
    this.initialValue,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  static final  Map<String, Widget> iconos = {
    'Alto': const Icon(Icons.height),
    'Profundidad': const Icon(Icons.height),
    'Ancho': Transform.rotate(
      angle: math.pi / 2,
      child: const Icon(Icons.height),
    ),
    'Espesor': const Icon(Icons.vertical_align_center),
    'Largo': const Icon(Icons.straighten),
    'Grueso': const Icon(Icons.height),
    'Tizón': Transform.rotate(
      angle: math.pi / 1.3,
      child: const Icon(Icons.height),
    ),
    'Soga': Transform.rotate(
      angle: math.pi / 2,
      child: const Icon(Icons.height),
    )
  };

  static const Map<String, String> etiquetas = {
    'Alto': 'Alto en Mts.',
    'Profundidad': 'Profundidad en Mts.',
    'Ancho': 'Ancho en Mts.',
    'Espesor': 'Espesor en Cms.',
    'Largo': 'Largo en Mts.',
    'Grueso': 'Grueso en Cms.',
    'Tizón': 'Tizón en Cms.',
    'Soga': 'Soga en Cms.'
  };

  Widget prefixIcon(String tipo) {
    return iconos[tipo]?? const Icon(Icons.error);
  }

  Widget label(String tipo) {
    return Text(etiquetas[tipo] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: TextAlign.right,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        prefixIcon: prefixIcon(tipo),
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        label: label(tipo),
      ),
      validator: (value) {
        if(value =='0'){
          return 'Ingresa un valor';
        }
        if (value?.isEmpty ?? true) {
          return 'Ingresa un valor';
        }
        if (value?.startsWith(',') ?? true) {
          return 'Solo "." es aceptado';
        }
        if (value?.contains(',') ?? true) {
          return 'Solo "." es aceptado';
        }
        return null;
      },
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
