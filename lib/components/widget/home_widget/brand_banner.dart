import 'package:flutter/material.dart';

import '../global_widget/has_images/clickable_image.dart';

class BrandBanner extends StatelessWidget {
  final String brandBannerImage;
  final String brandBannerTitle;
  final String brandBannerText;
  const BrandBanner(
      {super.key,
      required this.brandBannerImage,
      required this.brandBannerTitle,
      required this.brandBannerText});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClickableImage(x: 3, y: 4, assetImage: brandBannerImage),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  brandBannerTitle,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: const Color(0XFF121313)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Center(
              child: Text(brandBannerText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0XFF121313).withOpacity(0.5))),
            ),
          ),
        ]);
  }
}
