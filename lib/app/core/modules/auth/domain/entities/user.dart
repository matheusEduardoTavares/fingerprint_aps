import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_status_enum.dart';
import 'package:hive/hive.dart';

export 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_status_enum.dart';

part 'user.g.dart';

@HiveType(typeId : HiveHelper.userAdapterID)
class User {
  User({
    required this.login,
    required this.password,
    required this.authStatusEnum,
  });

  @HiveField(0)
  final String password;

  @HiveField(1)
  final String login;

  @HiveField(2)
  final AuthStatusEnum authStatusEnum;
}