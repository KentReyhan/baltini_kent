// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      userID: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      address: (fields[5] as List).cast<Address>(),
      order: (fields[6] as List).cast<Order>(),
      recentlyViewed: (fields[7] as List).cast<Product>(),
      recentlySearched: (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.order)
      ..writeByte(7)
      ..write(obj.recentlyViewed)
      ..writeByte(8)
      ..write(obj.recentlySearched);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
