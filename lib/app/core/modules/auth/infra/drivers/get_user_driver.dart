import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';

abstract class GetUserDriver {
  Future<User?> execute();
}