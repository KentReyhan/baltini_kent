import 'package:flutter/material.dart';

class ImageAspectRatio extends StatelessWidget {
  final int x;
  final int y;
  final Image image;
  const ImageAspectRatio(
      {super.key, required this.x, required this.y, required this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: x / y, child: image);
  }
}
