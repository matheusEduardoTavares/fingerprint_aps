import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_delete_account_repository.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_delete_account_driver.dart';

class HomeUserDeleteAccountRepositoryImpl implements HomeUserDeleteAccountRepository {

  HomeUserDeleteAccountRepositoryImpl({
    required HomeUserDeleteAccountDriver homeUserDeleteAccountDriver,
  }) : 
  _homeUserDeleteAccountDriver = homeUserDeleteAccountDriver;

  final HomeUserDeleteAccountDriver _homeUserDeleteAccountDriver;

  @override
  Future<void> deleteAccount() => _homeUserDeleteAccountDriver.deleteAccount();
}