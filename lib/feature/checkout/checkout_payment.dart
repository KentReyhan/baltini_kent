import 'package:baltini_kent/components/widget/cart_checkout_widget/payment/contact_info_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widget/cart_checkout_widget/bottom_row_cart_checkout.dart';
import '../../components/widget/cart_checkout_widget/order_summary.dart';
import '../../components/widget/cart_checkout_widget/price_list_row.dart';
import '../../components/widget/cart_checkout_widget/promo_code_input.dart';
import '../../components/widget/cart_checkout_widget/top_cart_checkout.dart';
import '../cart/cart_viewmodel.dart';
import 'checkout_viewmodel.dart';

class CheckoutPaymentPage extends StatelessWidget {
  const CheckoutPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartVM, CheckoutVM>(builder: (context, cart, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TopCartCheckout(text: 'Checkout', isOriginPayment: 'yes'),
              const OrderSummary(),
              const Padding(padding: EdgeInsets.only(bottom: 16, top: 16), child: PromoCodeInput()),
              PriceListRow(text: 'Subtotal', input: cart.subTotal),
              const PriceListRow(text: 'Shipping', input: 0),
              const PriceListRow(text: 'Import Duty/Taxes', isImportCheckout: true),
              PriceListRow(text: 'Estimated Taxes', input: cart.subTotal / 10),
              PriceListRow(text: 'Total', input: cart.subTotal, isTotal: true),
              Divider(color: Colors.black.withOpacity(0.5)),
              const ContactInfoPayment(),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('PAYMENT', style: Theme.of(context).textTheme.displayMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('All transactions are secure and encrypted.',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.paymentOption.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                        activeColor: Colors.black,
                        title: Text(vm.paymentOption[index],
                            style: Theme.of(context).textTheme.bodyMedium),
                        value: vm.paymentOption[index],
                        groupValue: vm.selectedPaymentOption,
                        onChanged: (input) {
                          vm.onChangedSelectedPaymentOption(input!);
                        });
                  }),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('BILLING ADDRESS', style: Theme.of(context).textTheme.displayMedium),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Select the address that matches your card or payment method.',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.billingAddressOption.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                        activeColor: Colors.black,
                        title: Text(vm.billingAddressOption[index],
                            style: Theme.of(context).textTheme.bodyMedium),
                        value: vm.billingAddressOption[index],
                        groupValue: vm.selectedBillingAddressOption,
                        onChanged: (input) {
                          vm.onChangedSelectedBillingAddressOption(input!);
                        });
                  }),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BottomRowCartCheckout(
                  text: 'PAY NOW',
                  callBack: () {
                    Navigator.pushNamed(context, '/');
                  },
                  isProtected: cart.isProtected,
                  subTotal: cart.subTotal,
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
