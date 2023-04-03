import 'dart:math';

import 'package:intl/intl.dart';

class StringUtils {
  static formatToIDR(number) {
    NumberFormat idrFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2);
    return idrFormat.format(double.parse(number));
  }

  static formatToIDRDivideBy4(number) {
    NumberFormat idrFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 2);
    double res = double.parse(number) / 4;
    return idrFormat.format(res);
  }

  static String getImagePlaceholder() {
    return 'assets/images/product/product_${randomNumPict()}.png';
  }

  static randomNumPict() {
    Random random = Random();
    return random.nextInt(11) + 1;
  }
}
