import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/const/img_string.dart';
import '../../components/utils/string_utils.dart';
import '../../components/widget/checkout_widget/price_list_row.dart';
import '../../components/widget/checkout_widget/top_checkout.dart';
import '../../components/widget/global_widget/image_aspect_ratio.dart';
import '../../components/widget/global_widget/text_field_cart_checkout.dart';
import '../cart/cart_viewmodel.dart';
import 'checkout_viewmodel.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartVM, CheckoutVM>(builder: (context, cart, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const TopCheckout(),
              Text('ORDER SUMMARY',
                  style: Theme.of(context).textTheme.displayMedium),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.cartProduct.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(children: [
                      cart.cartProduct.keys.elementAt(index).product.image ==
                              null
                          ? SizedBox(
                              width: 90,
                              height: 120,
                              child: ImageAspectRatio(
                                  x: 90,
                                  y: 120,
                                  image: Image.asset(placeholder)),
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
                            Text(
                                '${cart.cartProduct.keys.elementAt(index).product.vendor}',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            Text(
                                '${cart.cartProduct.keys.elementAt(index).product.title}',
                                style: Theme.of(context).textTheme.bodyMedium),
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
                            cart.isProtected
                                ? Row(
                                    children: [
                                      Image.asset(iconProtect),
                                      Text('Shipping protection',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium),
                                      Text(
                                          '(${StringUtils.formatToIDR(330000)})',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge)
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
              // ignore: prefer_const_constructors
              //PromoCodeInput(),
              PriceListRow(text: 'Subtotal', input: cart.subTotal),
              const PriceListRow(text: 'Shipping', input: 0),
              const PriceListRow(
                  text: 'Import Duty/Taxes', isImportCheckout: true),
              PriceListRow(text: 'Total', input: cart.subTotal, isTotal: true),

              const Spacer(),
              Text('CONTACT INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Already have an Account?',
                      style: Theme.of(context).textTheme.bodyMedium),
                  WidgetSpan(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('LOG IN',
                              style: Theme.of(context).textTheme.labelMedium)))
                ]),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: TextFieldCartCheckout(
                    hintText: 'Email',
                  )),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text('Email me with news and offers',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
              const Spacer(),

              Text('SHIPPING ADDRESS',
                  style: Theme.of(context).textTheme.displayMedium),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 60,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color(0XFFFEF1DE),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                      'Please double check the shipping address to ensure prompt delivery',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: TextFieldCartCheckout(
                    hintText: 'Country/Region',
                  )),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //TextFormField(),
              //Reusable
              //3x Dropdown() login / 2x Dropdown() no-login
              //6x TextField

              //Row()
              //AlertDialog()

              //ToPayment
              //Spacer()
              //Text()
              //2x Column(Row())
              //Spacer
              //Text()
              //RadioList.Builder()
              //Row()

              //Payment
              //ToPayment() -> Different RadioList.Builder()
              //
              //Different Address
              //Reusable
              //3x Dropdown() login / 2x Dropdown() no-login
              //6x TextField
              //Same Address
            ]),
          ),
        ),
      );
    });
  }
}
