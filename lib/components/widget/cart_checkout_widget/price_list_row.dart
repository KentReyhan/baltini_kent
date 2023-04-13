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
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: isImportCheckout == null
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(text, style: Theme.of(context).textTheme.bodyMedium),
                Text(
                    input != null
                        ? '${StringUtils.formatToIDR(input)}'
                        : 'Calculated on next step',
                    style: isTotal != null
                        ? Theme.of(context).textTheme.titleLarge
                        : Theme.of(context).textTheme.bodyMedium)
              ])
            : Row(
                children: [
                  Text(text, style: Theme.of(context).textTheme.bodyMedium),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.question_mark, size: 10),
                  ),
                  const Spacer(),
                  Text('Calculated on next step',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ));
  }
}
