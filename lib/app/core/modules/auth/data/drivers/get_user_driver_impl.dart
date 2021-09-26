import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/get_user_driver.dart';

class GetUserDriverImpl implements GetUserDriver{

  GetUserDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<User?> execute() async {
    await _localStorage.write<User>(LocalStorageHelper.userKey, User(
      authStatusEnum: AuthStatusEnum.logged,
      login: '1223',
      password: '54965965',
      permissionsUserEnum: PermissionsUserEnum.one,
    ));

    final hasUser = await _localStorage.contains(LocalStorageHelper.userKey);

    if (hasUser) {
      final user = await _localStorage.read<User>(LocalStorageHelper.userKey);

      return user;
    }
    
    return null;
  }
}