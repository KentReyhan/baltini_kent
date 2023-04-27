import 'package:baltini_kent/components/widget/global_widget/custom_button.dart';
import 'package:baltini_kent/feature/my_account/profile_address/vm/my_address_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/provider/user_provider.dart';
import '../../../../components/widget/global_widget/custom_text_field.dart';
import '../../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../../components/widget/login_register_widget/alert_dialog_login_register.dart';

class ChangeAddressPage extends StatefulWidget {
  final bool isEdit;
  final int? index;
  const ChangeAddressPage({super.key, required this.isEdit, this.index});

  @override
  State<ChangeAddressPage> createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<MyAddressVM, UserProvider>(
            builder: (context, vm, user, child) {
              if (widget.isEdit) {
                vm.init(context: context, isEditAddress: true);
              } else {
                vm.init(context: context, isEditAddress: false);
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBar(
                        text: widget.isEdit ? 'Change Address' : 'Add Address'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: CustomTextField(
                          controller: vm.firstNameController,
                          hintText: 'First Name'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.lastNameController,
                          hintText: 'Last Name'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.companyController,
                          hintText: 'Company (optional)'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.addressController,
                          hintText: 'Address 1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.optionalAddressController,
                          hintText: 'Address 2 (optional)'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.cityController, hintText: 'City'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.countryController,
                          hintText: 'Country/Region'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.stateController,
                          hintText: 'Province/State'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.zipCodeController,
                          hintText: 'Zip Code'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomTextField(
                          controller: vm.phoneController, hintText: 'Phone'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Incase we need to contact you about your order.',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2, 12, 4, 12),
                        child: !widget.isEdit && user.loginUser!.address.isEmpty
                            ? Container()
                            : Row(
                                children: [
                                  Checkbox(
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.black
                                                  .withOpacity(0.5)),
                                      activeColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.black),
                                      value: vm.isDefault,
                                      onChanged: (value) {
                                        vm.onChangedIsDefault(value!);
                                      }),
                                  Text('Set as default address',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
                                ],
                              )),
                    CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'SAVE ADDRESS',
                        variation: 'Black',
                        callBack: () async {
                          if (widget.isEdit) {
                            await vm.updateAddress(
                              user.loginUser!.userID,
                              widget.index!,
                            );
                          } else {
                            await vm.addAddress(user.loginUser!.userID);
                          }
                          if (!mounted) {
                            return;
                          }
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog(
                                    isSuccess: true,
                                    text: widget.isEdit
                                        ? 'Address Changed'
                                        : 'Address Added');
                              }).then((value) => Navigator.pop(context));
                        })
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
