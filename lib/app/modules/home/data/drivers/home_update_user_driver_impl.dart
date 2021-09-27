import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_update_user_driver.dart';

class HomeUpdateUserDriverImpl implements HomeUpdateUserDriver {

  HomeUpdateUserDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<User?> updateUser(User user) async {
    await _localStorage.write<User>(LocalStorageHelper.userKey, user);

    return user;
  }
}