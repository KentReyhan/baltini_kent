import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:baltini_kent/components/widget/global_widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/checkout/checkout_viewmodel.dart';
import '../../model/hive_model/address.dart';

class ShippingTextField extends StatelessWidget {
  const ShippingTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<CheckoutVM, UserProvider>(
        builder: (context, vm, user, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user.loginUser != null && user.loginUser!.address.isNotEmpty) ...{
            vm.init(
                context,
                user.loginUser!.address
                    .indexWhere((address) => address.isDefault == true)),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: DropdownButton<Address>(
                  items: user.loginUser!.address.map((address) {
                    return DropdownMenuItem(
                      value: address,
                      child: Text(
                          '${address.country} (${address.firstName} ${address.lastName})'),
                    );
                  }).toList(),
                  value: vm.selectedAddress,
                  onChanged: (value) {
                    vm.onChangedSelectedAddress(value!);
                  },
                )),
          },
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.countryController,
                  hintText: 'Country/Region')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.firstNameController, hintText: 'First Name')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.lastNameController, hintText: 'Last Name')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.addressController, hintText: 'Address')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.optionalAddressController,
                  hintText: 'Apartement, suite, etc. (optional)')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.cityController, hintText: 'City')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.stateController, hintText: 'State')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.zipCodeController, hintText: 'ZIP Code')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CustomTextField(
                  controller: vm.phoneController, hintText: 'Phone')),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 24),
            child: Text(
              'Incase we need to contact you about your order.',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          )
        ],
      );
    });
  }
}
