import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/const/img_string.dart';
import '../../../../components/provider/user_provider.dart';
import '../../../../components/widget/global_widget/custom_button.dart';
import '../../../../components/widget/global_widget/top_bar/top_bar.dart';
import '../vm/my_address_viewmodel.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({super.key});

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer2<MyAddressVM, UserProvider>(
            builder: (context, vm, user, child) {
              return Column(
                children: [
                  const TopBar(text: 'My Address'),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.loginUser!.address.length,
                      itemBuilder: (context, index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                '${user.loginUser!.address[index].firstName} ${user.loginUser!.address[index].lastName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium),
                                        user.loginUser!.address[index].isDefault
                                            ? const TextSpan(
                                                text: '(default address)')
                                            : const TextSpan(text: ''),
                                      ])),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration:
                                                const Duration(seconds: 10),
                                            backgroundColor:
                                                const Color(0XFFE8ECEE),
                                            content: Text('Address Deleted',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            action: SnackBarAction(
                                                label: 'Close',
                                                onPressed: () {
                                                  return;
                                                }),
                                          ));
                                          /*.closed
                                              .then((value) async =>
                                                  await vm.deleteAddress(
                                                      user.loginUser!.userID,
                                                      index));*/
                                        },
                                        iconSize: 50,
                                        icon: Image.asset(iconDelete))
                                  ]),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                    '${user.loginUser!.address[index].address}, ${user.loginUser!.address[index].city}, ${user.loginUser!.address[index].state}'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, bottom: 16),
                                child: Text(
                                    '${user.loginUser!.address[index].zipCode}, ${user.loginUser!.address[index].country}'),
                              ),
                              CustomButton(
                                width: MediaQuery.of(context).size.width / 1.1,
                                height: 40,
                                text: 'EDIT ADDRESS',
                                variation: 'White',
                                callBack: () {
                                  Navigator.pushNamed(
                                      context, '/my_account/address/change',
                                      arguments: index);
                                },
                              ),
                              Divider(color: Colors.black.withOpacity(0.5))
                            ]);
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: CustomButton(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        text: 'ADD NEW ADDRESS',
                        variation: 'Black',
                        callBack: () {
                          print(user.loginUser!.address.length);
                          Navigator.pushNamed(
                              context, '/my_account/address/add');
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
