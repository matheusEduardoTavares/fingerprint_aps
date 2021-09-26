import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/get_user_repository.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';

class GetUserUsecaseImpl implements GetUserUsecase {
  GetUserUsecaseImpl({
    required GetUserRepository getUserRepository,
  }) : 
  _getUserRepository = getUserRepository;

  final GetUserRepository _getUserRepository;

  @override
  Future<User?> execute() async => _getUserRepository.execute();
}