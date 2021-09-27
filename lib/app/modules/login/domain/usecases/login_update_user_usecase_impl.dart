import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/login/domain/repositories/login_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_update_user_usecase.dart';

class LoginUpdateUserUsecaseImpl implements LoginUpdateUserUsecase {

  LoginUpdateUserUsecaseImpl({
    required LoginUpdateUserRepository loginUpdateUserRepository,
  }) : 
  _loginUpdateUserRepository = loginUpdateUserRepository;

  final LoginUpdateUserRepository _loginUpdateUserRepository;

  @override
  Future<void> updateUser(User user) => _loginUpdateUserRepository.updateUser(user);
}