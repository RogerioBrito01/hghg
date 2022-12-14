import 'package:flutter/material.dart';

class TextFormFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  final FormFieldValidator? validator;
  final InputDecoration? decorations;
  final String? hintText;
  final bool obscureText;

  const TextFormFieldRegister(
      {Key? key,
      this.controller,
      this.validator,
      this.decorations,
      this.hintText,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            decoration:
                //InputDecoration(hintText: hintText, border: InputBorder.none)));
                InputDecoration(hintText: hintText)));
  }
}
