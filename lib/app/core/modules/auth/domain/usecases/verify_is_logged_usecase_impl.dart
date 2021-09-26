import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/verify_is_logged_repository.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';

class VerifyIsLoggedUsecaseImpl implements VerifyIsLoggedUsecase {
  VerifyIsLoggedUsecaseImpl({
    required VerifyIsLoggedRepository verifyIsLoggedRepository,
  }) : 
  _verifyIsLoggedRepository = verifyIsLoggedRepository;

  final VerifyIsLoggedRepository _verifyIsLoggedRepository;

  @override
  Future<bool> execute() async => _verifyIsLoggedRepository.execute();
}