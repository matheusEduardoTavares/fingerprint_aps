import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_delete_account_driver.dart';

class HomeUserDeleteAccountDriverImpl implements HomeUserDeleteAccountDriver {

  HomeUserDeleteAccountDriverImpl({
    required LocalStorage localStorage,
  }) : 
  _localStorage = localStorage;
  
  final LocalStorage _localStorage;

  @override
  Future<void> deleteAccount() async {
    await _localStorage.remove(LocalStorageHelper.userKey);
  }
}