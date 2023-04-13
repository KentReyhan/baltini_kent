// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 1;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      orderID: fields[0] as int,
      userID: fields[1] as int,
      address: fields[3] as Address,
      payment: fields[5] as Payment,
      products: (fields[2] as List).cast<CartProduct>(),
      shippingOption: fields[4] as ShippingMethod,
      orderDate: fields[6] as DateTime,
      isProtected: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.orderID)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.products)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.shippingOption)
      ..writeByte(5)
      ..write(obj.payment)
      ..writeByte(6)
      ..write(obj.orderDate)
      ..writeByte(7)
      ..write(obj.isProtected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
