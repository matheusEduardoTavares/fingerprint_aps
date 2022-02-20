import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';

export 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';

class UserViewModel {
  UserViewModel({
    required this.login,
    required this.password,
    this.permissionsUserEnum,
  });
  
  final String login;
  final String password;
  final PermissionsUserEnum? permissionsUserEnum;

  UserViewModel copyWith({
    String? login,
    String? password,
    PermissionsUserEnum? permissionsUserEnum,
  }) {
    return UserViewModel(
      login: login ?? this.login,
      password: password ?? this.password,
      permissionsUserEnum: permissionsUserEnum ?? this.permissionsUserEnum,
    );
  }
}
