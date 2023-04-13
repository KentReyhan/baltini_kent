import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget/global_widget/top_bar.dart';
import '../vm/login_viewmodel.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
              child: Text('We\'ll send link to reset your password in this email.',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
