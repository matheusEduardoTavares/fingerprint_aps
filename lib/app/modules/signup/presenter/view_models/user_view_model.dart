import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';

class UserViewModel {
  UserViewModel({
    required this.login,
    required this.password,
    required this.permissionsUserEnum,
  });
  
  final String login;
  final String password;
  final PermissionsUserEnum permissionsUserEnum;
}