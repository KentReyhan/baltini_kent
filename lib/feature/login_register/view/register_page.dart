import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget/global_widget/custom_button.dart';
import '../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../components/widget/login_register_widget/alert_dialog_login_register.dart';
import '../../../components/widget/login_register_widget/custom_pass_text_field.dart';
import '../../../components/widget/login_register_widget/custom_text_field.dart';
import '../vm/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<RegisterVM>(
          builder: (context, vm, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(text: 'Create Account'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                      controller: vm.firstNameController,
                      hintText: 'First Name'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                      controller: vm.lastNameController, hintText: 'Last Name'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextFormField(
                      controller: vm.emailController, hintText: 'Email'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomPassTextFormField(
                      controller: vm.passwordController, hintText: 'Password'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'CREATE',
                        variation: 'Black',
                        callBack: () async {
                          if (await vm.validateRegister() == false) {
                            if (!mounted) {
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: const Color(0XFFE8ECEE),
                              content: Text('Register failed',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () => ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar()),
                            ));
                          } else {
                            if (!mounted) {
                              return;
                            }
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const CustomAlertDialog(
                                      isSuccess: true, text: 'Account Created');
                                });
                          }
                        }),
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
