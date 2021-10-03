import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';

abstract class HomeUpdateUserUsecase {
  Future<User?> updateUser(UserViewModel userData);
}