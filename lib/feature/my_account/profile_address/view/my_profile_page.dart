import 'package:baltini_kent/components/provider/user_provider.dart';
import 'package:baltini_kent/feature/my_account/profile_address/vm/my_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/widget/global_widget/custom_button.dart';
import '../../../../components/widget/global_widget/custom_text_field.dart';
import '../../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../../../../components/widget/login_register_widget/alert_dialog_login_register.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<MyProfileVM, UserProvider>(
            builder: (context, vm, user, child) {
              vm.init(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopBar(text: 'My Profile'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                        controller: vm.emailController, hintText: 'Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, '/my_account/profile/password'),
                        child: Text('CHANGE PASSWORD',
                            style: Theme.of(context).textTheme.labelMedium)),
                  ),
                  CustomButton(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 40,
                      text: 'SAVE',
                      variation: 'Black',
                      callBack: () async {
                        await vm.updateUser(user.loginUser!.userID);
                        if (!mounted) {
                          return;
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomAlertDialog(
                                  isSuccess: true, text: 'Profile Changed');
                            });
                      })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
