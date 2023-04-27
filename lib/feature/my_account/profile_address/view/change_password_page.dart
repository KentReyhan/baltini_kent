import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:baltini_kent/feature/my_account/profile_address/vm/my_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/widget/global_widget/custom_button.dart';
import '../../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../../components/widget/login_register_widget/alert_dialog_login_register.dart';
import '../../../../components/widget/login_register_widget/custom_pass_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<MyProfileVM, UserProvider>(
            builder: (context, vm, user, child) {
              return Column(
                children: [
                  const TopBar(text: 'Change Password'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomPassTextFormField(
                        controller: vm.passwordController,
                        hintText: 'Old Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomPassTextFormField(
                        controller: vm.newPasswordController,
                        hintText: 'New Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomPassTextFormField(
                        controller: vm.confirmPasswordController,
                        hintText: 'Confirm Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'CHANGE PASSWORD',
                        variation: 'Black',
                        callBack: () async {
                          await vm.updatePassword(user.loginUser!.userID);
                          if (!mounted) {
                            return;
                          }
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomAlertDialog(
                                    isSuccess: true, text: 'Password Changed');
                              });
                        }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
