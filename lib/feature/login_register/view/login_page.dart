import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget/global_widget/top_bar.dart';
import '../vm/login_vm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<LoginVM>(
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
              TextFormField(),
              TextFormField(),
              TextButton(onPressed: () {}, child: Text('FORGOT PASSWORD')),
              ElevatedButton(onPressed: () {}, child: Text('LOGIN')),
              Center(child: Text('ok')),
              ElevatedButton(onPressed: () {}, child: Text('CREATE BALTINI ACCOUNT')),
            ],
          );
        },
      )),
    );
  }
}
