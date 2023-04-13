// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentAdapter extends TypeAdapter<Payment> {
  @override
  final int typeId = 3;

  @override
  Payment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payment(
      paymentID: fields[0] as int,
      orderID: fields[1] as int,
      subTotal: fields[2] as double,
      shippingCost: fields[3] as double,
      importDuty: fields[4] as double,
      estimatedTaxes: fields[5] as double,
      paymentMethod: fields[6] as String,
      paymentTime: fields[7] as DateTime,
      billingAddress: fields[8] as Address,
    );
  }

  @override
  void write(BinaryWriter writer, Payment obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.paymentID)
      ..writeByte(1)
      ..write(obj.orderID)
      ..writeByte(2)
      ..write(obj.subTotal)
      ..writeByte(3)
      ..write(obj.shippingCost)
      ..writeByte(4)
      ..write(obj.importDuty)
      ..writeByte(5)
      ..write(obj.estimatedTaxes)
      ..writeByte(6)
      ..write(obj.paymentMethod)
      ..writeByte(7)
      ..write(obj.paymentTime)
      ..writeByte(8)
      ..write(obj.billingAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
