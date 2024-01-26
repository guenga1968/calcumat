// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardLadrillo extends StatelessWidget {
  const CardLadrillo({
    Key? key,
    this.onTap,
    required this.texto,
    this.color,
  }) : super(key: key);
  final void Function()? onTap;
  final String texto;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onTertiary,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * .2 > 100
              ? MediaQuery.of(context).size.width * .2
              : 100,
          height: MediaQuery.of(context).size.height * .2 > 100
              ? MediaQuery.of(context).size.height * .2
              : 100,
          child: Center(
            child: AutoSizeText( texto, textAlign: TextAlign.center,maxLines: 3,
            ),
          ),
        ),
      ),
    );
  }
}
