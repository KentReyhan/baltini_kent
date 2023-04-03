import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      //padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Center(
        child: Text('Free worldwide express shipping on all orders over \$200',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white)),
      ),
    );
  }
}
