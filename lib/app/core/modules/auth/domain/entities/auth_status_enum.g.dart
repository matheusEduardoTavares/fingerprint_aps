// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_status_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthStatusEnumAdapter extends TypeAdapter<AuthStatusEnum> {
  @override
  final int typeId = 1;

  @override
  AuthStatusEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AuthStatusEnum.empty;
      case 1:
        return AuthStatusEnum.logged;
      case 2:
        return AuthStatusEnum.unlogged;
      default:
        return AuthStatusEnum.empty;
    }
  }

  @override
  void write(BinaryWriter writer, AuthStatusEnum obj) {
    switch (obj) {
      case AuthStatusEnum.empty:
        writer.writeByte(0);
        break;
      case AuthStatusEnum.logged:
        writer.writeByte(1);
        break;
      case AuthStatusEnum.unlogged:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthStatusEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
