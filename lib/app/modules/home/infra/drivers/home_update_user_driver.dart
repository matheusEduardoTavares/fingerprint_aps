import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';

abstract class HomeUpdateUserDriver {
  Future<User?> updateUser(User user);
}