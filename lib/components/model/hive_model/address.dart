import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address extends HiveObject {
  @HiveField(0)
  int addressID;

  @HiveField(1)
  int userID;

  @HiveField(2)
  String firstName;

  @HiveField(3)
  String lastName;

  @HiveField(4)
  String country;

  @HiveField(5)
  String state;

  @HiveField(6)
  String city;

  @HiveField(7)
  String address;

  @HiveField(8)
  String zipCode;

  @HiveField(9)
  String? optionalAddress;

  @HiveField(10)
  String? company;

  @HiveField(11)
  bool isDefault;

  @HiveField(12)
  String phone;

  Address(
      {required this.addressID,
      required this.userID,
      required this.firstName,
      required this.lastName,
      required this.country,
      required this.state,
      required this.city,
      required this.address,
      required this.zipCode,
      required this.isDefault,
      required this.phone,
      this.optionalAddress,
      this.company});
}
