import 'package:baltini_kent/components/widget/global_widget/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/provider/user_provider.dart';
import '../../components/widget/global_widget/custom_button.dart';
import '../../components/widget/login_register_widget/alert_dialog_login_register.dart';
import '../../components/widget/login_register_widget/logout_widget.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<UserProvider>(
          builder: (context, user, child) {
            if (user.loginUser == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('My Account',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const InfoWidget(text: 'About Baltini', top: 8, bottom: 8),
                  const InfoWidget(
                      text: 'Terms and Conditions', top: 8, bottom: 8),
                  const InfoWidget(text: 'Partnership', top: 8, bottom: 8),
                  const InfoWidget(text: 'Helps', top: 8, bottom: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Center(
                        child: CustomButton(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 40,
                            text: 'LOGIN TO BALTINI',
                            variation: 'Black',
                            callBack: () {
                              Navigator.pushNamed(context, '/login');
                            })),
                  )
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('My Account',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        'Hi, ${user.loginUser!.firstName} ${user.loginUser!.lastName}',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  InfoWidget(
                    text: 'My Profile',
                    top: 8,
                    bottom: 8,
                    callBack: () {
                      Navigator.pushNamed(context, '/my_account/profile')
                          .then((value) => setState(() {}));
                    },
                  ),
                  InfoWidget(
                      text: 'My Address',
                      top: 8,
                      bottom: 8,
                      callBack: () {
                        Navigator.pushNamed(context, '/my_account/address');
                      }),
                  const InfoWidget(text: 'About Baltini', top: 8, bottom: 8),
                  const InfoWidget(
                      text: 'Terms and Conditions', top: 8, bottom: 8),
                  const InfoWidget(text: 'Partnership', top: 8, bottom: 8),
                  const InfoWidget(text: 'Helps', top: 8, bottom: 8),
                  LogoutWidget(
                      text: 'Logout',
                      top: 0,
                      bottom: 8,
                      callBack: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomAlertDialog(
                                  isSuccess: true, text: 'Logout success');
                            });
                        user.logout();
                      })
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
