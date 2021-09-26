import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/repositories/signup_repository.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/usecases/signup_usecase.dart';

class SignupUsecaseImpl implements SignupUsecase {

  SignupUsecaseImpl({
    required SignupRepository signupRepository,
  }) : 
  _signupRepository = signupRepository;

  final SignupRepository _signupRepository;

  @override
  Future<void> createUser(UserViewModel userData) async {
    final user = User(
      authStatusEnum: AuthStatusEnum.logged,
      login: userData.login,
      password: userData.password,
      permissionsUserEnum: userData.permissionsUserEnum,
    );

    await _signupRepository.createUser(user);
  }
}