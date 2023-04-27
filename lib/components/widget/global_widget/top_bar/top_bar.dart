import 'package:flutter/material.dart';

import '../../../const/img_string.dart';

class TopBar extends StatelessWidget {
  final String text;
  const TopBar({super.key, required this.text});

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
                      Navigator.pop(context);
                    },
                    icon: Image.asset(iconBack)),
              )),
          Text(text, style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
