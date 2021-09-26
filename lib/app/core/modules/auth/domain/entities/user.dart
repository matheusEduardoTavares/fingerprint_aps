import 'package:hive/hive.dart';

import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';

export 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';
export 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user_extension.dart';

part 'user.g.dart';

@HiveType(typeId : HiveHelper.userAdapterID)
class User {
  User({
    required this.login,
    required this.password,
    required this.authStatusEnum,
    required this.permissionsUserEnum,
  });

  @HiveField(0)
  final String password;

  @HiveField(1)
  final String login;

  @HiveField(2)
  final AuthStatusEnum authStatusEnum;

  @HiveField(3)
  final PermissionsUserEnum permissionsUserEnum;

  @override
  String toString() {
    return 'User(password: $password, login: $login, authStatusEnum: $authStatusEnum, permissionsUserEnum: $permissionsUserEnum)';
  }

  User copyWith({
    String? password,
    String? login,
    AuthStatusEnum? authStatusEnum,
    PermissionsUserEnum? permissionsUserEnum,
  }) {
    return User(
      password: password ?? this.password,
      login: login ?? this.login,
      authStatusEnum: authStatusEnum ?? this.authStatusEnum,
      permissionsUserEnum: permissionsUserEnum ?? this.permissionsUserEnum,
    );
  }
}
