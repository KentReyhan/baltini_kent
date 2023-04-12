import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class PromoCodeInput extends StatelessWidget {
  const PromoCodeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: const InputDecoration(
            hintText: 'Gift card or discount code',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFA3ABAE))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFFA3ABAE))),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: FittedBox(
            fit: BoxFit.cover,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                iconCevronRight,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
