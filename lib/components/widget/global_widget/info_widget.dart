import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  final double top;
  final double bottom;
  final VoidCallback? callBack;
  const InfoWidget(
      {super.key,
      required this.text,
      required this.top,
      required this.bottom,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callBack,
        child: Column(
          children: [
            SizedBox(height: top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child:
                      Text(text, style: Theme.of(context).textTheme.bodyMedium),
                ),
                Image.asset(iconCevronRight),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            SizedBox(height: bottom)
          ],
        ));
  }
}
