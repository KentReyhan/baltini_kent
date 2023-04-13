import 'package:baltini_kent/feature/checkout/checkout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfoShipping extends StatelessWidget {
  const ContactInfoShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutVM>(
      builder: (context, vm, child) {
        return Column(
          children: [
            Text('CONTACT INFORMATION',
                style: Theme.of(context).textTheme.displayMedium),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text('Already have an Account?',
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextButton(
                      onPressed: () {},
                      child: Text('LOG IN',
                          style: Theme.of(context).textTheme.labelMedium))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextFormField(
                  initialValue: vm.email,
                  onChanged: (value) {
                    vm.onChangedEmail(value);
                  },
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  ),
                )),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('Email me with news and offers',
                    style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ],
        );
      },
    );
  }
}
