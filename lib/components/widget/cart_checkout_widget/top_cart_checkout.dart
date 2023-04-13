import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class TopCartCheckout extends StatelessWidget {
  final String text;
  final String? isOriginPayment;
  const TopCartCheckout({super.key, required this.text, this.isOriginPayment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                fit: BoxFit.cover,
                child: IconButton(
                    onPressed: () {
                      if (isOriginPayment == 'yes') {
                        Navigator.pushNamed(context, '/checkout/shipping');
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: Image.asset(iconBack)),
              )),
          Text(text, style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
