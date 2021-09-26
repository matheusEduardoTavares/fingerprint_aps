import 'package:bloc/bloc.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_state.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_status_enum.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';

class AuthController extends Cubit<AuthState> {
  AuthController({
    required VerifyIsLoggedUsecase verifyIsLoggedUsecase,
  }): 
  _verifyIsLoggedUsecase = verifyIsLoggedUsecase,
  super(AuthState.initial());

  final VerifyIsLoggedUsecase _verifyIsLoggedUsecase;

  Future<void> verifyIsLogged() async {
    final isLogged = await _verifyIsLoggedUsecase.execute();
    AuthState newState;

    if (isLogged) {
      newState = state.copyWith(authStatusEnum: AuthStatusEnum.logged);
    }
    else {
      newState = state.copyWith(authStatusEnum: AuthStatusEnum.unlogged);
    }

    emit(newState);
  }
}