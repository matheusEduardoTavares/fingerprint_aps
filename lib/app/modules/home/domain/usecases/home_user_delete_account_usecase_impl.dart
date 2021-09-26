import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_delete_account_repository.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_delete_account_usecase.dart';

class HomeUserDeleteAccountUsecaseImpl implements HomeUserDeleteAccountUsecase {

  HomeUserDeleteAccountUsecaseImpl({
    required HomeUserDeleteAccountRepository homeUserDeleteAccountRepository,
  }) : 
  _homeUserDeleteAccountRepository = homeUserDeleteAccountRepository;

  final HomeUserDeleteAccountRepository _homeUserDeleteAccountRepository;

  @override
  Future<void> deleteAccount() => _homeUserDeleteAccountRepository.deleteAccount();
}