import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/get_user_repository.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/get_user_driver.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  GetUserRepositoryImpl({
    required GetUserDriver getUserDriver
  }) : 
  _getUserDriver = getUserDriver;

  final GetUserDriver _getUserDriver;

  @override
  Future<User?> execute() async => _getUserDriver.execute();
}