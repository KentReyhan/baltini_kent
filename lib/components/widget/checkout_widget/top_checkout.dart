import 'package:flutter/material.dart';

import '../global_widget/back_button.dart';

class TopCheckout extends StatelessWidget {
  const TopCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          const BackButtons(),
          Text('Checkout', style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
