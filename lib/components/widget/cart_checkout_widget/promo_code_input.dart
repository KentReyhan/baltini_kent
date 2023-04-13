import 'package:flutter/material.dart';

import '../../const/img_string.dart';
import '../global_widget/text_field_cart_checkout.dart';

class PromoCodeInput extends StatelessWidget {
  const PromoCodeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextFieldCartCheckout(
              hintText: 'Gift card or discount code',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
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
        ),
      ],
    );
  }
}
