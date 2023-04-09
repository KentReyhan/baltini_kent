import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/product_detail/product_detail_viewmodel.dart';
import '../../const/img_string.dart';
import '../../model/product.dart';
import '../../utils/string_utils.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ProductDetailVM>(context, listen: false)
            .insertRecentlyViewed(product);
        Navigator.pushNamed(context, '/product_detail', arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            product.image == null
                ? Image.asset(placeholder)
                : Image.network(product.image['src']),
            const SizedBox(height: 8),
            Text(product.vendor!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 8),
            Text(product.title!,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0XFF121313).withOpacity(0.5))),
            const SizedBox(height: 8),
            Text(StringUtils.formatToIDR(product.price),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0XFF121313).withOpacity(0.5)))
          ],
        ),
      ),
    );
  }
}
