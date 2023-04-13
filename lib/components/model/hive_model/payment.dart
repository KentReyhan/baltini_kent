import 'package:hive/hive.dart';

import 'address.dart';

part 'payment.g.dart';

@HiveType(typeId: 3)
class Payment extends HiveObject {
  @HiveField(0)
  int paymentID;

  @HiveField(1)
  int orderID;

  @HiveField(2)
  double subTotal;

  @HiveField(3)
  double shippingCost;

  @HiveField(4)
  double importDuty;

  @HiveField(5)
  double estimatedTaxes;

  @HiveField(6)
  String paymentMethod;

  @HiveField(7)
  DateTime paymentTime;

  @HiveField(8)
  Address billingAddress;

  Payment(
      {required this.paymentID,
      required this.orderID,
      required this.subTotal,
      required this.shippingCost,
      required this.importDuty,
      required this.estimatedTaxes,
      required this.paymentMethod,
      required this.paymentTime,
      required this.billingAddress});
}
