import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/login/infra/repositories/drivers/login_update_user_driver.dart';

class LoginUpdateUserDriverImpl implements LoginUpdateUserDriver {

  LoginUpdateUserDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<void> updateUser(User user) async {
    await _localStorage.write<User>(LocalStorageHelper.userKey, user);
  }
}