import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/get_user_repository.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_manually_usecase.dart';

class LoginManuallyUsecaseImpl implements LoginManuallyUsecase {

  LoginManuallyUsecaseImpl({
    required GetUserRepository getUserRepository,
  }) : 
  _getUserRepository = getUserRepository;

  final GetUserRepository _getUserRepository;

  @override
  Future<bool> doLogin(UserViewModel userData) async {
    final user = await _getUserRepository.execute();
    if (user != null) {
      return user.compaireToLogin(userData);
    }

    return false;
  }
}