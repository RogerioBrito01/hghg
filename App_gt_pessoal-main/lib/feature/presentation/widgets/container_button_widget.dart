import 'package:flutter/material.dart';

class ContainerButtonWidget extends StatelessWidget {
  final Color color;
  final String texto;
  final Border? border;

  const ContainerButtonWidget({
    Key? key,
    required this.color,
    this.border,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Text(
        texto,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
      ),
    );
  }
}
