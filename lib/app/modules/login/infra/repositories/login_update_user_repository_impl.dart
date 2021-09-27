import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/login/domain/repositories/login_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/login/infra/repositories/drivers/login_update_user_driver.dart';

class LoginUpdateUserRepositoryImpl implements LoginUpdateUserRepository {

  LoginUpdateUserRepositoryImpl({
    required LoginUpdateUserDriver loginUpdateUserDriver,
  }) : 
  _loginUpdateUserDriver = loginUpdateUserDriver;

  final LoginUpdateUserDriver _loginUpdateUserDriver;

  @override
  Future<void> updateUser(User user) => _loginUpdateUserDriver.updateUser(user);
}