import 'package:flutter/material.dart';

class ProductDetailText extends StatelessWidget {
  final String detailLabel;
  final String detailText;
  const ProductDetailText(
      {super.key, required this.detailLabel, required this.detailText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Text('$detailLabel : ',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w800)),
        ),
        Text(detailText, style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
