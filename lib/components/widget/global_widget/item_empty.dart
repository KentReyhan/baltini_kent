import 'package:flutter/material.dart';

import '../../const/img_string.dart';

class ItemEmpty extends StatelessWidget {
  const ItemEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Image.asset(iconEmpty)),
      const Text('No item found'),
      const Text('Try again with another filter or keyword')
    ]);
  }
}
