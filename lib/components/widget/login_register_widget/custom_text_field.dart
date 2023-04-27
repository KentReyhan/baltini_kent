import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(color: Color(0XFFA3ABAE)),
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
      ),
    );
  }
}
