import 'package:flutter/material.dart';

class TextFieldCartCheckout extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final VoidCallback? callBack;
  const TextFieldCartCheckout(
      {super.key, required this.hintText, this.initialValue, this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: (text) {
        callBack;
      },
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0XFFA3ABAE))),
      ),
    );
  }
}
