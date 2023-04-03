import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          fit: BoxFit.cover,
          child: ImageIcon(AssetImage(iconCart)),
        ),
      ),
    );
  }
}
