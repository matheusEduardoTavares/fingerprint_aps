// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_user_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PermissionsUserEnumAdapter extends TypeAdapter<PermissionsUserEnum> {
  @override
  final int typeId = 2;

  @override
  PermissionsUserEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PermissionsUserEnum.one;
      case 1:
        return PermissionsUserEnum.two;
      case 2:
        return PermissionsUserEnum.three;
      case 3:
        return PermissionsUserEnum.four;
      case 4:
        return PermissionsUserEnum.fifth;
      default:
        return PermissionsUserEnum.one;
    }
  }

  @override
  void write(BinaryWriter writer, PermissionsUserEnum obj) {
    switch (obj) {
      case PermissionsUserEnum.one:
        writer.writeByte(0);
        break;
      case PermissionsUserEnum.two:
        writer.writeByte(1);
        break;
      case PermissionsUserEnum.three:
        writer.writeByte(2);
        break;
      case PermissionsUserEnum.four:
        writer.writeByte(3);
        break;
      case PermissionsUserEnum.fifth:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PermissionsUserEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
