import 'package:bloc/bloc.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/user_state.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';

class AuthController extends Cubit<UserState> {
  AuthController({
    required GetUserUsecase getUserUsecase,
  }): 
  _getUserUsecase = getUserUsecase,
  super(UserState.initial());

  final GetUserUsecase _getUserUsecase;

  Future<User?> getUser() async {
    final user = await _getUserUsecase.execute();

    if (user != null) {
      emit(state.copyWith(user: user));
    }
    else {
      emit(state.copyWith(user: User.initial()));
    }

    return user;
  }

  void updateUserState(User newUser) {
    emit(state.copyWith(user: newUser));
  }
}