import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:fingerprint_aps/app/core/helpers/home_page_texts.dart';
import 'package:hive/hive.dart';

part 'permissions_user_enum.g.dart';

@HiveType(typeId: HiveHelper.permissionsUserEnumAdapterID)
enum PermissionsUserEnum {
  @HiveField(0)
  one,
  @HiveField(1)
  two,
  @HiveField(2)
  three,
  @HiveField(3)
  four,
  @HiveField(4)
  fifth,
  @HiveField(5)
  sixth,
}

extension PermissionsUserEnumExt on PermissionsUserEnum {
  static final displayValues = displayValuesMap.values.toList();
  static final displayKeys = displayValuesMap.keys.toList();
  static final displayEntries = displayValuesMap.entries.toList();

  static const displayValuesMap = {
    PermissionsUserEnum.one: 'Permissão um',
    PermissionsUserEnum.two: 'Permissão dois',
    PermissionsUserEnum.three: 'Permissão três',
    PermissionsUserEnum.four: 'Permissão quatro',
    PermissionsUserEnum.fifth: 'Permissão cinco',
    PermissionsUserEnum.sixth: 'Permissão seis',
  };

  static const displayTextsMap = {
    PermissionsUserEnum.one: HomePageTexts.firstPermission,
    PermissionsUserEnum.two: HomePageTexts.secondPermission,
    PermissionsUserEnum.three: HomePageTexts.thirdPermission,
    PermissionsUserEnum.four: HomePageTexts.fourthPermission,
    PermissionsUserEnum.fifth: HomePageTexts.fifthPermission,
    PermissionsUserEnum.sixth: HomePageTexts.sixthPermission,
  };

  String get displayValue => displayValuesMap[this]!;
  String get displayTextValue => displayTextsMap[this]!;
}
