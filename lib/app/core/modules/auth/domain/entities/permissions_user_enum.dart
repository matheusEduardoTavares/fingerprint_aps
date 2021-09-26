import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:hive/hive.dart';

part 'permissions_user_enum.g.dart';

@HiveType(typeId : HiveHelper.permissionsUserEnumAdapterID)
enum PermissionsUserEnum {
  @HiveField(0)
  one,
  @HiveField(1)
  two,
  @HiveField(2)
  three
}