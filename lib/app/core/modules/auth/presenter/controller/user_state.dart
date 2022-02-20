import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';

class UserState {
  UserState({
    required this.user,
  });

  factory UserState.initial() => UserState(user: User(
    authStatusEnum: AuthStatusEnum.empty,
    login: '',
    password: '',
    permissionsUserEnum: PermissionsUserEnum.one,
  ));
  
  final User user;  

  UserState copyWith({
    User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
