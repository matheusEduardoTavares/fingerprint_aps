import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_logout_repository.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_logout_usecase.dart';

class HomeUserLogoutUsecaseImpl implements HomeUserLogoutUsecase {

  HomeUserLogoutUsecaseImpl({
    required HomeUserLogoutRepository homeUserLogoutRepository,
  }) : 
  _homeUserLogoutRepository = homeUserLogoutRepository;

  final HomeUserLogoutRepository _homeUserLogoutRepository;

  @override
  Future<void> logout() => _homeUserLogoutRepository.logout();
}