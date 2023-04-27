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
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      country: fields[4] as String,
      state: fields[5] as String,
      city: fields[6] as String,
      address: fields[7] as String,
      zipCode: fields[8] as String,
      isDefault: fields[11] as bool,
      phone: fields[12] as String,
      optionalAddress: fields[9] as String?,
      company: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.addressID)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.city)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.zipCode)
      ..writeByte(9)
      ..write(obj.optionalAddress)
      ..writeByte(10)
      ..write(obj.company)
      ..writeByte(11)
      ..write(obj.isDefault)
      ..writeByte(12)
      ..write(obj.phone);
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
