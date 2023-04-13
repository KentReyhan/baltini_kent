import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address extends HiveObject {
  @HiveField(0)
  int addressID;

  @HiveField(1)
  int userID;

  @HiveField(2)
  String country;

  @HiveField(3)
  String state;

  @HiveField(4)
  String city;

  @HiveField(5)
  String address;

  @HiveField(6)
  String zipCode;

  @HiveField(7)
  String? optionalAddress;

  @HiveField(8)
  String? company;

  Address(
      {required this.addressID,
      required this.userID,
      required this.country,
      required this.state,
      required this.city,
      required this.address,
      required this.zipCode,
      this.optionalAddress,
      this.company});
}
