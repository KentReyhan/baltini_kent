import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:baltini_kent/components/widget/global_widget/custom_text_field.dart';
import 'package:baltini_kent/feature/checkout/checkout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfoShipping extends StatelessWidget {
  const ContactInfoShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CheckoutVM, UserProvider>(
      builder: (context, vm, user, child) {
        if (user.loginUser != null) {
          return Column(
            children: [
              Text('CONTACT INFORMATION',
                  style: Theme.of(context).textTheme.displayMedium),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                    '${user.loginUser!.firstName} ${user.loginUser!.lastName} (${user.loginUser!.email})',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Email me with news and offers',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ],
          );
        } else {
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
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text('LOG IN',
                            style: Theme.of(context).textTheme.labelMedium))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: CustomTextField(
                      controller: vm.emailController, hintText: 'Email')),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Email me with news and offers',
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
