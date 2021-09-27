import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_logout_repository.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_logout_driver.dart';

class HomeUserLogoutRepositoryImpl implements HomeUserLogoutRepository {

  HomeUserLogoutRepositoryImpl({
    required HomeUserLogoutDriver homeUserLogoutDriver,
  }) : 
  _homeUserLogoutDriver = homeUserLogoutDriver;

  final HomeUserLogoutDriver _homeUserLogoutDriver;

  @override
  Future<void> logout() => _homeUserLogoutDriver.logout();
}