import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';

abstract class LoginUpdateUserRepository {
  Future<void> updateUser(User user);
}