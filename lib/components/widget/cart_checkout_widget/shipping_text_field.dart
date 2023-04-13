import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/checkout/checkout_viewmodel.dart';

class ShippingTextField extends StatelessWidget {
  const ShippingTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutVM>(builder: (context, vm, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.country,
                onChanged: (value) {
                  vm.onChangedCountry(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'Country/Region',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.firstName,
                onChanged: (value) {
                  vm.onChangedFirstName(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.lastName,
                onChanged: (value) {
                  vm.onChangedLastName(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.country,
                onChanged: (value) {
                  vm.onChangedCompany(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'Company(optional)',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.address,
                onChanged: (value) {
                  vm.onChangedAddress(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'Address',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.optionalAddress,
                onChanged: (value) {
                  vm.onChangedOptionalAddress(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'Apartment, suite, etc. (optional)',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.city,
                onChanged: (value) {
                  vm.onChangedCity(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'City',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.state,
                onChanged: (value) {
                  vm.onChangedState(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'State',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextFormField(
                initialValue: vm.zipCode,
                onChanged: (value) {
                  vm.onChangedZipCode(value);
                },
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: 'ZIP Code',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                ),
              )),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: TextFormField(
                    initialValue: vm.phone,
                    onChanged: (value) {
                      vm.onChangedPhone(value);
                    },
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFA3ABAE))),
                    ),
                  )),
            ],
          ),
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
