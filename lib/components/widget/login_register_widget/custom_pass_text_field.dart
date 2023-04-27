import 'package:flutter/material.dart';

class CustomPassTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomPassTextFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  State<CustomPassTextFormField> createState() =>
      _CustomPassTextFormFieldState();
}

class _CustomPassTextFormFieldState extends State<CustomPassTextFormField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyLarge,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.hintText,
        suffixIcon: IconButton(
            icon: !_passwordVisible
                ? const Icon(Icons.visibility_off_outlined, color: Colors.black)
                : const Icon(Icons.visibility, color: Colors.black),
            onPressed: () {
              if (_passwordVisible == false) {
                setState(() {
                  _passwordVisible = true;
                });
              } else {
                setState(() {
                  _passwordVisible = false;
                });
              }
            }),
        labelStyle: const TextStyle(color: Color(0XFFA3ABAE)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
      ),
    );
  }
}
