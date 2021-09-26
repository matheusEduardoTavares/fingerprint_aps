import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/verify_is_logged_driver.dart';

class VerifyIsLoggedDriverImpl implements VerifyIsLoggedDriver {
  @override
  Future<bool> execute() async {
    await Future.delayed(const Duration(seconds: 3));
    
    return false;
  }
}