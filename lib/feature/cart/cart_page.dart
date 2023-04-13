import 'package:baltini_kent/components/utils/string_utils.dart';
import 'package:baltini_kent/components/widget/global_widget/image_aspect_ratio.dart';
import 'package:baltini_kent/feature/cart/cart_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/widget/cart_checkout_widget/bottom_row_cart_checkout.dart';
import '../../components/widget/cart_checkout_widget/cart/cart_quantity_box.dart';
import '../../components/widget/global_widget/back_button.dart';
import '../../components/widget/global_widget/item_empty.dart';
import '../../components/widget/global_widget/text_field_cart_checkout.dart';
import '../../components/widget/cart_checkout_widget/top_cart_checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartVM>(context, listen: false).subTotal = 0;
    Provider.of<CartVM>(context, listen: false)
        .cartProduct
        .forEach((key, value) {
      Provider.of<CartVM>(context, listen: false).subTotal =
          Provider.of<CartVM>(context, listen: false).subTotal +
              (key.product.price! * value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, vm, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: vm.cartProduct.isEmpty
                  ? Column(
                      children: [
                        TopCartCheckout(text: 'Cart(${vm.cartProduct.length})'),
                        const ItemEmpty(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TopCartCheckout(
                              text: 'Cart(${vm.cartProduct.length})'),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: vm.cartProduct.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(children: [
                                vm.cartProduct.keys
                                            .elementAt(index)
                                            .product
                                            .image ==
                                        null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 90,
                                          height: 120,
                                          child: ImageAspectRatio(
                                              x: 3,
                                              y: 4,
                                              image: Image.asset(placeholder)),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 90,
                                        height: 120,
                                        child: ImageAspectRatio(
                                            x: 3,
                                            y: 4,
                                            image: Image.network(vm
                                                .cartProduct.keys
                                                .elementAt(index)
                                                .product
                                                .image['src'])),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox.fromSize(
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                            vm.cartProduct.keys
                                                        .elementAt(index)
                                                        .product
                                                        .vendor!
                                                        .length >=
                                                    25
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40),
                                        child: Text(
                                            '${vm.cartProduct.keys.elementAt(index).product.vendor}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium),
                                      ),
                                      SizedBox.fromSize(
                                        size: Size(
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                            vm.cartProduct.keys
                                                        .elementAt(index)
                                                        .product
                                                        .title!
                                                        .length >=
                                                    30
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40),
                                        child: Text(
                                          '${vm.cartProduct.keys.elementAt(index).product.title}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                          '${vm.cartProduct.keys.elementAt(index).size},${vm.cartProduct.keys.elementAt(index).color}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: const Color(0XFF121313)
                                                      .withOpacity(0.5))),
                                      Text(
                                          StringUtils.formatToIDR(vm
                                              .cartProduct.keys
                                              .elementAt(index)
                                              .product
                                              .price),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: const Color(0XFF121313)
                                                      .withOpacity(0.5))),
                                      CartQuantityBox(index: index)
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          },
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: Text('ORDER NOTES',
                                style:
                                    Theme.of(context).textTheme.displayMedium)),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: TextFieldCartCheckout(
                              hintText: 'Leave Notes',
                            )),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 0, 8),
                                    child: Text(
                                      '1 Click Protect ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                                  Text('(${StringUtils.formatToIDR(330000)})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: const Color(0XFF121313)
                                                  .withOpacity(0.5))),
                                  const SizedBox(width: 60),
                                  CupertinoSwitch(
                                      value: vm.isProtected,
                                      onChanged: (value) {
                                        vm.onChangeIsProtected(value);
                                      })
                                ]),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 112, 8),
                                  child: Text(
                                      'Instantly resolve shipping issues.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 256),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text('Learn More',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              'All orders are processed in USD at the most recent exchange rate available. Shipping, taxes, and discounts codes calculated at checkout. Please check the box below to agree with our Terms and Conditions.',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: const Color(0XFF121313)
                                          .withOpacity(0.5))),
                        ),
                        Row(children: [
                          Checkbox(
                              value: vm.isChecked,
                              onChanged: (value) {
                                vm.onChangeIsChecked(value!);
                              }),
                          Text('I agree with the ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextButton(
                              onPressed: () {},
                              child: Text('Terms and Conditions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontSize: 14)))
                        ]),
                        Divider(color: Colors.black.withOpacity(0.5)),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: BottomRowCartCheckout(
                            text: 'CHECK OUT',
                            callBack: () {
                              Navigator.pushNamed(
                                  context, '/checkout/shipping');
                            },
                            isProtected: vm.isProtected,
                            subTotal: vm.subTotal,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
