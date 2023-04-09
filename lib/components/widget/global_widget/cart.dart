import 'package:baltini_kent/components/const/img_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/cart/cart_viewmodel.dart';
import 'package:badges/badges.dart' as badges;

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(builder: (context, vm, child) {
      return badges.Badge(
          key: Key(vm.cartProduct.length.toString()),
          position: badges.BadgePosition.bottomEnd(),
          showBadge: true,
          ignorePointer: false,
          onTap: () {
            Navigator.pushNamed(context, '/cart');
          },
          badgeContent: Container(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
              child: Text(vm.cartProduct.length.toString(),
                  style: const TextStyle(color: Colors.white))),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.transparent,
            elevation: 0,
          ),
          child: const SizedBox(
            height: 50,
            width: 50,
            child: FittedBox(
              fit: BoxFit.cover,
              child: ImageIcon(AssetImage(iconCart)),
            ),
          ));
    });
  }
}
