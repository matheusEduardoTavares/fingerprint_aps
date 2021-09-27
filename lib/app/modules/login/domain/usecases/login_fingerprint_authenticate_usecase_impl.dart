import 'package:fingerprint_aps/app/core/fingerprint_auth/fingerprint_auth.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_fingerprint_authenticate_usecase.dart';

class LoginFingerprintAuthenticateUsecaseImpl implements LoginFingerprintAuthenticateUsecase {

  LoginFingerprintAuthenticateUsecaseImpl({
    required FingerprintAuth fingerprintAuth,
  }) : 
  _fingerprintAuth = fingerprintAuth;

  final FingerprintAuth _fingerprintAuth;  

  @override
  Future<bool?> authenticate() => _fingerprintAuth.authenticate();
}