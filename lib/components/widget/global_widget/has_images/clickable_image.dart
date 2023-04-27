import 'package:flutter/material.dart';

class ClickableImage extends StatelessWidget {
  final int x;
  final int y;
  final String assetImage;
  const ClickableImage(
      {super.key, required this.x, required this.y, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
          aspectRatio: x / y, child: Image(image: AssetImage(assetImage))),
    );
  }
}
