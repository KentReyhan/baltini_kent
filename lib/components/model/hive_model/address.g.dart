// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 2;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      addressID: fields[0] as int,
      userID: fields[1] as int,
      country: fields[2] as String,
      state: fields[3] as String,
      city: fields[4] as String,
      address: fields[5] as String,
      zipCode: fields[6] as String,
      optionalAddress: fields[7] as String?,
      company: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.addressID)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.zipCode)
      ..writeByte(7)
      ..write(obj.optionalAddress)
      ..writeByte(8)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
