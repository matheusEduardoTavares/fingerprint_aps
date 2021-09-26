import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_status_enum.dart';

class AuthState {
  AuthState({
    required this.authStatusEnum,
  });

  factory AuthState.initial() => 
    AuthState(authStatusEnum: AuthStatusEnum.empty);

  final AuthStatusEnum authStatusEnum;

  AuthState copyWith({
    AuthStatusEnum? authStatusEnum,
  }) {
    return AuthState(
      authStatusEnum: authStatusEnum ?? this.authStatusEnum,
    );
  }
}
