import 'package:baltini_kent/components/widget/global_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/provider/user_provider.dart';
import '../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../components/widget/login_register_widget/alert_dialog_login_register.dart';
import '../../../components/widget/login_register_widget/custom_pass_text_field.dart';
import '../../../components/widget/login_register_widget/custom_text_field.dart';
import '../vm/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Consumer<LoginVM>(
          builder: (context, vm, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(text: 'Login'),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text('Login with your email address and password.',
                      style: Theme.of(context).textTheme.bodyLarge),
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
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/forgot_password'),
                      child: Text('FORGOT PASSWORD',
                          style: Theme.of(context).textTheme.labelMedium)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'LOGIN',
                        variation: 'Black',
                        callBack: () async {
                          if (await vm.loginAuth() == false) {
                            if (!mounted) {
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: const Color(0XFFE8ECEE),
                              content: Text(
                                  'Login failed, please check your email or password',
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
                            await Provider.of<UserProvider>(context,
                                    listen: false)
                                .getUser(vm.emailController.text,
                                    vm.passwordController.text);
                            if (!mounted) {
                              return;
                            }
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return const CustomAlertDialog(
                                      isSuccess: true, text: 'Login success');
                                });
                            if (!mounted) {
                              return;
                            }
                            Navigator.pushNamed(context, '/my_account');
                          }
                        }),
                  ),
                ),
                Center(
                    child: Text('or',
                        style: Theme.of(context).textTheme.bodyLarge)),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'CREATE BALTINI ACCOUNT',
                        variation: 'White',
                        callBack: () {
                          Navigator.pushNamed(context, '/register');
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
