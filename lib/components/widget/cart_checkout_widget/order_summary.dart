import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/cart/cart_viewmodel.dart';
import '../../const/img_string.dart';
import '../../utils/string_utils.dart';
import '../global_widget/image_aspect_ratio.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(builder: (context, cart, child) {
      return Column(
        children: [
          Text('ORDER SUMMARY',
              style: Theme.of(context).textTheme.displayMedium),
          ListView.builder(
            shrinkWrap: true,
            itemCount: cart.cartProduct.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(children: [
                  cart.cartProduct.keys.elementAt(index).product.image == null
                      ? SizedBox(
                          width: 90,
                          height: 120,
                          child: ImageAspectRatio(
                              x: 90, y: 120, image: Image.asset(placeholder)),
                        )
                      : SizedBox(
                          width: 90,
                          height: 120,
                          child: ImageAspectRatio(
                              x: 3,
                              y: 4,
                              image: Image.network(cart.cartProduct.keys
                                  .elementAt(index)
                                  .product
                                  .image['src'])),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox.fromSize(
                          size: Size(
                              MediaQuery.of(context).size.width / 1.8,
                              cart.cartProduct.keys
                                          .elementAt(index)
                                          .product
                                          .vendor!
                                          .length >=
                                      25
                                  ? MediaQuery.of(context).size.height / 20
                                  : MediaQuery.of(context).size.height / 40),
                          child: Text(
                              '${cart.cartProduct.keys.elementAt(index).product.vendor}',
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
                        SizedBox.fromSize(
                          size: Size(
                              MediaQuery.of(context).size.width / 1.7,
                              cart.cartProduct.keys
                                          .elementAt(index)
                                          .product
                                          .title!
                                          .length >=
                                      30
                                  ? MediaQuery.of(context).size.height / 20
                                  : MediaQuery.of(context).size.height / 40),
                          child: Text(
                            '${cart.cartProduct.keys.elementAt(index).product.title}',
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                            '${cart.cartProduct.keys.elementAt(index).size},${cart.cartProduct.keys.elementAt(index).color}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color(0XFF121313)
                                        .withOpacity(0.5))),
                        Text(
                            '${StringUtils.formatToIDR(cart.cartProduct.keys.elementAt(index).product.price)} x ${cart.cartProduct.values.elementAt(index)}',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text(
                            '${StringUtils.formatToIDR(cart.cartProduct.keys.elementAt(index).product.price! * cart.cartProduct.values.elementAt(index))}',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ]),
              );
            },
          ),
          cart.isProtected
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 120,
                        child: ImageAspectRatio(
                            x: 3, y: 4, image: Image.asset(iconProtect)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: [
                            Text('Shipping protection',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            Text('${StringUtils.formatToIDR(330000)}',
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      );
    });
  }
}
