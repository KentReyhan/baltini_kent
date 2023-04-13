import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/widget/global_widget/top_bar.dart';
import '../vm/login_viewmodel.dart';
import '../vm/register_viewmodel.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<RegisterVM>(
        builder: (context, vm, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(text: 'Create Account'),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextButton(onPressed: () {/*showDialog(AlertDialog())*/}, child: Text('CREATE')),
            ],
          );
        },
      )),
    );
  }
}
