import 'package:flutter/material.dart';

import '../../utils/string_utils.dart';

class ImageAspectRatio extends StatelessWidget {
  final int x;
  final int y;
  const ImageAspectRatio({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: x / y,
        child: Image.asset(StringUtils.getImagePlaceholder()));
  }
}
