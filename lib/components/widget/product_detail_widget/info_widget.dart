import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  const InfoWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            ),
            Image.asset(iconCevronRight),
            const SizedBox(
              width: 16,
            ),
          ],
        ));
  }
}
