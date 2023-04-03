import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class QuantityBox extends StatelessWidget {
  const QuantityBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4))),
            child: FittedBox(
              fit: BoxFit.cover,
              child: IconButton(onPressed: () {}, icon: Image.asset(iconMinus)),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 80,
          decoration: const BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal: BorderSide(color: Colors.black)),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: '1',
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4))),
            child: FittedBox(
              fit: BoxFit.cover,
              child: IconButton(onPressed: () {}, icon: Image.asset(iconPlus)),
            )),
      ],
    );
  }
}
