import 'package:flutter/material.dart';

import '../../utils/string_utils.dart';

class BottomRowCartCheckout extends StatelessWidget {
  final bool isProtected;
  final double subTotal;
  final VoidCallback callBack;
  final String text;
  const BottomRowCartCheckout(
      {super.key,
      required this.isProtected,
      required this.subTotal,
      required this.callBack,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(StringUtils.formatToIDR(subTotal),
                style: Theme.of(context).textTheme.titleSmall),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: SizedBox(
            width: 160,
            height: 40,
            child: ElevatedButton(
                onPressed: callBack,
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(40)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFF121313))),
                child: Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
