import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class BackButtons extends StatelessWidget {
  final String? isOriginSearch;
  const BackButtons({super.key, this.isOriginSearch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          fit: BoxFit.cover,
          child: IconButton(
              onPressed: () {
                if (isOriginSearch == 'yes') {
                  Navigator.pushNamed(context, '/');
                } else {
                  Navigator.of(context).pop(context);
                }
              },
              icon: Image.asset(iconBack)),
        ));
  }
}
