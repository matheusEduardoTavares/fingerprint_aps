import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:hive/hive.dart';

part 'auth_status_enum.g.dart';

@HiveType(typeId : HiveHelper.authStatusEnumAdapterID)
enum AuthStatusEnum {
  @HiveField(0)
  empty,
  @HiveField(1)
  logged,
  @HiveField(2)
  unlogged,
}

extension AuthStatusEnumExt on AuthStatusEnum {
  bool get isLogged => this == AuthStatusEnum.logged;
}