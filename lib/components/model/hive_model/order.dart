import 'package:baltini_kent/components/model/cart_product.dart';
import 'package:hive/hive.dart';

import '../shipping_method.dart';
import 'address.dart';
import 'payment.dart';

part 'order.g.dart';

@HiveType(typeId: 1)
class Order extends HiveObject {
  @HiveField(0)
  int orderID;

  @HiveField(1)
  int userID;

  @HiveField(2)
  List<CartProduct> products;

  @HiveField(3)
  Address address;

  @HiveField(4)
  ShippingMethod shippingOption;

  @HiveField(5)
  Payment payment;

  @HiveField(6)
  DateTime orderDate;

  @HiveField(7)
  bool isProtected;

  Order(
      {required this.orderID,
      required this.userID,
      required this.address,
      required this.payment,
      required this.products,
      required this.shippingOption,
      required this.orderDate,
      required this.isProtected});
}
