import 'package:baltini_kent/components/const/img_string.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final bool isSuccess;
  final String text;
  const CustomAlertDialog(
      {super.key, required this.isSuccess, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: isSuccess ? Image.asset(iconSuccess) : Image.asset(iconClose),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text(text, style: Theme.of(context).textTheme.titleLarge)),
        ],
      ),
    );
  }
}
