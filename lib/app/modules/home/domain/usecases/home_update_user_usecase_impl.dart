import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';

class HomeUpdateUserUsecaseImpl implements HomeUpdateUserUsecase {

  HomeUpdateUserUsecaseImpl({
    required HomeUpdateUserRepository homeUpdateUserRepository,
  }) : 
  _homeUpdateUserRepository = homeUpdateUserRepository;

  final HomeUpdateUserRepository _homeUpdateUserRepository;

  @override
  Future<User?> updateUser(UserViewModel userData) async {
    final user = User(
      login: userData.login, 
      password: userData.password, 
      authStatusEnum: AuthStatusEnum.logged, 
      permissionsUserEnum: userData.permissionsUserEnum!,
    );
    
    return _homeUpdateUserRepository.updateUser(user);
  }
  
}