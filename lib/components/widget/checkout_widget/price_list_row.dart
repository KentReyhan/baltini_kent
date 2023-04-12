import 'package:flutter/material.dart';

import '../../utils/string_utils.dart';

class PriceListRow extends StatelessWidget {
  final String text;
  final double? input;
  final bool? isImportCheckout;
  final bool? isTotal;
  const PriceListRow(
      {super.key,
      required this.text,
      this.input,
      this.isImportCheckout,
      this.isTotal});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      isImportCheckout != null
          ? RichText(
              text: TextSpan(children: [
              TextSpan(text: text),
              WidgetSpan(
                  child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color(0XFF121313).withOpacity(0.5)),
                ),
                child: const Icon(Icons.question_mark),
              ))
            ]))
          : Text(text, style: Theme.of(context).textTheme.bodyMedium),
      Text(
          input != null
              ? '(${StringUtils.formatToIDR(input)})'
              : 'Calculated on next step',
          style: isTotal != null
              ? Theme.of(context).textTheme.titleLarge
              : Theme.of(context).textTheme.bodyMedium)
    ]);
  }
}
