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

extension PermissionsUserEnumExt on PermissionsUserEnum {
  static final displayValues = displayValuesMap.values.toList();
  static final displayKeys = displayValuesMap.keys.toList();
  static final displayEntries = displayValuesMap.entries.toList();

  static const displayValuesMap = {
    PermissionsUserEnum.one: 'Permissão um',
    PermissionsUserEnum.two: 'Permissão dois',
    PermissionsUserEnum.three: 'Permissão três',
  };

  String get displayValue => displayValuesMap[this]!;
}