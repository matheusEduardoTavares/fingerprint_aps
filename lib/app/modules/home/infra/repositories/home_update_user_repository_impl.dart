import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_update_user_driver.dart';

class HomeUpdateUserRepositoryImpl implements HomeUpdateUserRepository {

  HomeUpdateUserRepositoryImpl({
    required HomeUpdateUserDriver homeUpdateUserDriver,
  }) : 
  _homeUpdateUserDriver = homeUpdateUserDriver;

  final HomeUpdateUserDriver _homeUpdateUserDriver;

  @override
  Future<User?> updateUser(User user) => _homeUpdateUserDriver.updateUser(user);
}