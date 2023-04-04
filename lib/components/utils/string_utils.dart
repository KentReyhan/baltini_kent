import 'dart:math';

import 'package:intl/intl.dart';

class StringUtils {
  static formatToIDR(number) {
    NumberFormat idrFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2);
    return idrFormat.format(number);
  }

  static String getImagePlaceholder() {
    return 'assets/images/product/product_${randomNumPict()}.png';
  }

  static randomNumPict() {
    Random random = Random();
    return random.nextInt(11) + 1;
  }
}
