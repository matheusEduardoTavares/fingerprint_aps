import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/repositories/signup_repository.dart';
import 'package:fingerprint_aps/app/modules/signup/infra/drivers/signup_driver.dart';

class SignupRepositoryImpl implements SignupRepository {

  SignupRepositoryImpl({
    required SignupDriver signupDriver,
  }) : 
  _signupDriver = signupDriver;

  final SignupDriver _signupDriver;

  @override
  Future<void> createUser(User user) => _signupDriver.createUser(user);
}