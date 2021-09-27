import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_logout_driver.dart';

class HomeUserLogoutDriverImpl implements HomeUserLogoutDriver {

  HomeUserLogoutDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<void> logout() async {
    final currentUser = await _localStorage.read<User>(LocalStorageHelper.userKey);

    await _localStorage.write<User>(LocalStorageHelper.userKey, currentUser!.copyWith(
      authStatusEnum: AuthStatusEnum.unlogged,
    ));
  }
}