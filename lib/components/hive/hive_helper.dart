import 'package:hive/hive.dart';

import '../model/hive_model/address.dart';
import '../model/hive_model/order.dart';
import '../model/hive_model/payment.dart';
import '../model/hive_model/user.dart';

late Box userBox;
late Box orderBox;
late Box addressBox;
late Box paymentBox;

class HiveHelper {
  static initAdapter() {
    Hive.registerAdapter(UserAdapter());
    //Hive.registerAdapter(OrderAdapter());
    Hive.registerAdapter(AddressAdapter());
    //Hive.registerAdapter(PaymentAdapter());
  }

  static openAllBox() async {
    userBox = await Hive.openBox<User>('user');
    //orderBox = await Hive.openBox<Order>('activity');
    addressBox = await Hive.openBox<Address>('activity');
    //paymentBox = await Hive.openBox<Payment>('activity');
  }

  static seedActivity() {
    userBox.deleteFromDisk();
    //ActivitySeeder.seedActivity();
  }
}
