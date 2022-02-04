// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserContactAdapter extends TypeAdapter<UserContact> {
  @override
  final int typeId = 0;

  @override
  UserContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserContact()
      ..contact = fields[0] as Contact
      ..name = fields[1] as String
      ..phoneNumber = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, UserContact obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.contact)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
