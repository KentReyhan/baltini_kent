import 'package:hive/hive.dart';

import '../product.dart';
import 'address.dart';
import 'order.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int userID;

  @HiveField(1)
  String firstName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String email;

  @HiveField(4)
  String password;

  @HiveField(5)
  List<Address> address;

  @HiveField(6)
  List<Order> order;

  @HiveField(7)
  List<Product> recentlyViewed;

  @HiveField(8)
  List<String> recentlySearched;

  User({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.address = const [],
    this.order = const [],
    this.recentlyViewed = const [],
    this.recentlySearched = const [],
  });
}
