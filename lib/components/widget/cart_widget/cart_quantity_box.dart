import 'package:baltini_kent/feature/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/img_string.dart';

class CartQuantityBox extends StatelessWidget {
  final int index;
  const CartQuantityBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, vm, child) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4))),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: IconButton(
                      onPressed: () {
                        vm.subOneQuantity(index);
                      },
                      icon: Image.asset(iconMinus)),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 80,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide.none,
                    horizontal: BorderSide(color: Colors.black)),
              ),
              child: TextFormField(
                key: Key(vm.cartProduct.values.elementAt(index).toString()),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: vm.cartProduct.values.elementAt(index).toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  vm.onChangeQuantity(index, int.parse(value));
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4))),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: IconButton(
                      onPressed: () {
                        vm.addOneQuantity(index);
                      },
                      icon: Image.asset(iconPlus)),
                )),
          ],
        );
      },
    );
  }
}
