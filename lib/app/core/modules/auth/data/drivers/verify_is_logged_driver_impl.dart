import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/verify_is_logged_driver.dart';

class VerifyIsLoggedDriverImpl implements VerifyIsLoggedDriver {
  VerifyIsLoggedDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;

  final LocalStorage _localStorage;

  static const userKey = 'userData';

  @override
  Future<bool> execute() async {
    // await _localStorage.write<User>(userKey, User(
    //   authStatusEnum: AuthStatusEnum.unlogged,
    //   login: 'aaaaaaaa',
    //   password: 'bbbbbbbb'
    // ));

    final hasUser = await _localStorage.contains(userKey);

    if (hasUser) {
      final user = await _localStorage.read<User>(userKey);

      if (user != null) {
        return user.authStatusEnum.isLogged;
      }
    }
    
    return false;
  }
}