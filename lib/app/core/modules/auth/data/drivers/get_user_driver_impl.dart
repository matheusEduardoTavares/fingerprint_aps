import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
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
    final hasUser = await _localStorage.contains(LocalStorageHelper.userKey);

    if (hasUser) {
      final user = await _localStorage.read<User>(LocalStorageHelper.userKey);

      return user;
    }
    
    return null;
  }
}