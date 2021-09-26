import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';

abstract class SignupUsecase {
  Future<void> createUser(UserViewModel userData);
}