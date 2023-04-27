import 'package:baltini_kent/feature/checkout/checkout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class ContactInfoPayment extends StatelessWidget {
  const ContactInfoPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<CheckoutVM, UserProvider>(
      builder: (context, vm, user, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('CONTACT INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CONTACT',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black.withOpacity(0.5))),
                    user.loginUser == null
                        ? TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/checkout/shipping');
                            },
                            child: Text('CHANGE',
                                style: Theme.of(context).textTheme.labelMedium))
                        : Container()
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(vm.emailController.text),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SHIP TO',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.black.withOpacity(0.5))),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout/shipping');
                        },
                        child: Text('CHANGE',
                            style: Theme.of(context).textTheme.labelMedium))
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                  '${vm.addressController.text},${vm.cityController.text},${vm.stateController.text}',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                  '${vm.zipCodeController.text},${vm.countryController.text}',
                  style: Theme.of(context).textTheme.bodyLarge),
            )
            //vm.isMethod? :Container()
          ],
        );
      },
    );
  }
}
