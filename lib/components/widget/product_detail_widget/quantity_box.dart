import 'package:baltini_kent/components/provider/quantity_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/img_string.dart';

class QuantityBox extends StatefulWidget {
  const QuantityBox({
    super.key,
  });

  @override
  State<QuantityBox> createState() => _QuantityBoxState();
}

class _QuantityBoxState extends State<QuantityBox> {
  @override
  void initState() {
    Provider.of<QuantityProvider>(context, listen: false).quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuantityProvider>(
      builder: (context, qty, child) {
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
                        qty.subOneQuantity();
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
                key: Key(qty.quantity.toString()),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: qty.quantity.toString(),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  value != ''
                      ? qty.onChangeQuantity(int.parse(value))
                      : qty.onChangeQuantity(0);
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
                        qty.addOneQuantity();
                      },
                      icon: Image.asset(iconPlus)),
                )),
          ],
        );
      },
    );
  }
}
