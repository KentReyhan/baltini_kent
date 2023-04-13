import 'package:baltini_kent/components/widget/cart_checkout_widget/payment/contact_info_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/utils/string_utils.dart';
import '../../components/widget/cart_checkout_widget/bottom_row_cart_checkout.dart';
import '../../components/widget/cart_checkout_widget/order_summary.dart';
import '../../components/widget/cart_checkout_widget/price_list_row.dart';
import '../../components/widget/cart_checkout_widget/promo_code_input.dart';
import '../../components/widget/cart_checkout_widget/top_cart_checkout.dart';
import '../cart/cart_viewmodel.dart';
import 'checkout_viewmodel.dart';

class CheckoutToPaymentPage extends StatelessWidget {
  const CheckoutToPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartVM, CheckoutVM>(builder: (context, cart, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TopCartCheckout(text: 'Checkout'),
              const OrderSummary(),
              const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  child: PromoCodeInput()),
              PriceListRow(text: 'Subtotal', input: cart.subTotal),
              const PriceListRow(text: 'Shipping', input: 0),
              PriceListRow(
                  text: 'Import Duty/Taxes',
                  input: vm.selectedShippingOption.isNotEmpty
                      ? cart.subTotal * vm.selectedShippingTax
                      : 0),
              PriceListRow(text: 'Estimated Taxes', input: cart.subTotal / 10),
              PriceListRow(text: 'Total', input: cart.subTotal, isTotal: true),
              Divider(color: Colors.black.withOpacity(0.5)),
              const ContactInfoPayment(),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('SHIPPING METHOD',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.shippingOption.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                        activeColor: Colors.black,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(vm.shippingOption[index].shippingDetail,
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(
                                '${StringUtils.formatToIDR(vm.shippingOption[index].shippingCost)} Shipping',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: const Color(0XFF121313)
                                            .withOpacity(0.5))),
                            Text(
                                '${StringUtils.formatToIDR(cart.subTotal * vm.shippingOption[index].shippingTax)} Import Duty & Taxes',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: const Color(0XFF121313)
                                            .withOpacity(0.5)))
                          ],
                        ),
                        value: vm.shippingOption[index].shippingDetail,
                        groupValue: vm.selectedShippingOption,
                        onChanged: (input) {
                          vm.onChangedSelectedShippingOption(input!);
                          vm.onChangedSelectedShippingTax(
                              vm.shippingOption[index].shippingTax);
                        });
                  }),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BottomRowCartCheckout(
                  text: 'TO PAYMENT',
                  callBack: () {
                    Navigator.pushNamed(context, '/checkout/payment');
                  },
                  isProtected: cart.isProtected,
                  subTotal: cart.subTotal +
                      cart.subTotal / 10 +
                      cart.subTotal * vm.selectedShippingTax,
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
