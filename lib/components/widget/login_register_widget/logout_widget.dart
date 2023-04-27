import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class LogoutWidget extends StatelessWidget {
  final String text;
  final double top;
  final double bottom;
  final VoidCallback? callBack;
  const LogoutWidget(
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
                  child: Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.red)),
                ),
                IconButton(
                    iconSize: 20,
                    onPressed: callBack,
                    icon: const Icon(Icons.logout, color: Colors.red)),
                const SizedBox(
                  width: 0,
                ),
              ],
            ),
            SizedBox(height: bottom)
          ],
        ));
  }
}
