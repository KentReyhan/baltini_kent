import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 80,
        child: FittedBox(
          fit: BoxFit.cover,
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(context),
              icon: Image.asset(iconBack)),
        ));
  }
}
