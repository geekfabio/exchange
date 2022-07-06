import 'package:flutter/material.dart';

class ExchanceFormField extends StatelessWidget {
  const ExchanceFormField({Key? key, this.controller, required this.hintText})
      : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        hoverColor: const Color.fromRGBO(255, 255, 255, 1),
        isDense: false,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
