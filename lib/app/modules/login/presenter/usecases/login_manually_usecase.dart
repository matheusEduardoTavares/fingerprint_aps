import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';

abstract class LoginManuallyUsecase {
  Future<bool?> doLogin(UserViewModel userData);
}