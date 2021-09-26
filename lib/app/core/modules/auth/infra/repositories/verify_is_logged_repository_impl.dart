import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/verify_is_logged_repository.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/verify_is_logged_driver.dart';

class VerifyIsLoggedRepositoryImpl implements VerifyIsLoggedRepository {
  VerifyIsLoggedRepositoryImpl({
    required VerifyIsLoggedDriver verifyIsLoggedDriver
  }) : 
  _verifyIsLoggedDriver = verifyIsLoggedDriver;

  final VerifyIsLoggedDriver _verifyIsLoggedDriver;

  @override
  Future<bool> execute() async => _verifyIsLoggedDriver.execute();
}