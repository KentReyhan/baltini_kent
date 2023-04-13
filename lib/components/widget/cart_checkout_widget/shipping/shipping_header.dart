import 'package:flutter/material.dart';

class ShippingHeader extends StatelessWidget {
  const ShippingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('SHIPPING ADDRESS',
            style: Theme.of(context).textTheme.displayMedium),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 60,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color(0XFFFEF1DE),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                  'Please double check the shipping address to ensure prompt delivery',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ),
      ],
    );
  }
}
