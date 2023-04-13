import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../feature/checkout/checkout_viewmodel.dart';

class ShippingAlertDialog extends StatelessWidget {
  const ShippingAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutVM>(
      builder: (context, vm, child) {
        return AlertDialog(
          title: Text('Is the shipping address correct?',
              style: Theme.of(context).textTheme.titleLarge),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(vm.address, style: Theme.of(context).textTheme.bodyMedium),
              Text(vm.city, style: Theme.of(context).textTheme.bodyMedium),
              Text(vm.state, style: Theme.of(context).textTheme.bodyMedium),
              Text(vm.zipCode, style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    vm.onChangedAlertDialog(false);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size.fromHeight(40)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0XFF121313))),
                  child: Text('MODIFY ADDRESS',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white))),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout/to_payment');
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size.fromHeight(40)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0XFF121313))),
                  child: Text('YES, PROCEED',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white))),
            )
          ],
        );
      },
    );
  }
}
