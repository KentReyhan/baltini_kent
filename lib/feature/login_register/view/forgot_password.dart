import 'package:baltini_kent/components/widget/login_register_widget/alert_dialog_login_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget/global_widget/custom_button.dart';
import '../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../components/widget/login_register_widget/custom_pass_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(text: 'Forgot Password'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                  'We\'ll send link to reset your password in this email.',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomPassTextFormField(
                  controller: _emailController, hintText: 'Password'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: CustomButton(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 40,
                    text: 'CREATE',
                    variation: 'Black',
                    callBack: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomAlertDialog(
                                isSuccess: true,
                                text:
                                    'Please check your email inbox for further instruction');
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
