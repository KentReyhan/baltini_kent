import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widget/cart_checkout_widget/bottom_row_cart_checkout.dart';
import '../../components/widget/cart_checkout_widget/order_summary.dart';
import '../../components/widget/cart_checkout_widget/price_list_row.dart';
import '../../components/widget/cart_checkout_widget/promo_code_input.dart';
import '../../components/widget/cart_checkout_widget/shipping/contact_info_shipping.dart';
import '../../components/widget/cart_checkout_widget/shipping/shipping_alert_dialog.dart';
import '../../components/widget/cart_checkout_widget/shipping/shipping_header.dart';
import '../../components/widget/cart_checkout_widget/shipping_text_field.dart';
import '../../components/widget/cart_checkout_widget/top_cart_checkout.dart';
import '../cart/cart_viewmodel.dart';
import 'checkout_viewmodel.dart';

class CheckoutShippingPage extends StatelessWidget {
  const CheckoutShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartVM, CheckoutVM>(builder: (context, cart, vm, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const TopCartCheckout(text: 'Checkout'),
              const OrderSummary(),
              const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  child: PromoCodeInput()),
              PriceListRow(text: 'Subtotal', input: cart.subTotal),
              const PriceListRow(text: 'Shipping', input: 0),
              const PriceListRow(
                  text: 'Import Duty/Taxes', isImportCheckout: true),
              PriceListRow(text: 'Total', input: cart.subTotal, isTotal: true),
              Divider(color: Colors.black.withOpacity(0.5)),
              const ContactInfoShipping(),
              vm.isAlertDialog
                  ? Container()
                  : Column(
                      children: [
                        Divider(color: Colors.black.withOpacity(0.5)),
                        const ShippingHeader(),
                        const ShippingTextField(),
                      ],
                    ),
              Divider(color: Colors.black.withOpacity(0.5)),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BottomRowCartCheckout(
                  text: 'SHIPPING',
                  callBack: () {
                    if (vm.checkIfEmpty() == true) {
                      vm.onChangedAlertDialog(true);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const ShippingAlertDialog();
                          });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: const Color(0XFFE8ECEE),
                          content: Text(
                              'All the non-optional field must be filled',
                              style: Theme.of(context).textTheme.bodyMedium)));
                      return;
                    }
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
