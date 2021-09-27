import 'package:bloc/bloc.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/user_state.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';

class AuthController extends Cubit<UserState> {
  AuthController({
    required GetUserUsecase getUserUsecaseUsecase,
  }): 
  _getUserUsecaseUsecase = getUserUsecaseUsecase,
  super(UserState.initial());

  final GetUserUsecase _getUserUsecaseUsecase;

  Future<User?> getUser() async {
    final user = await _getUserUsecaseUsecase.execute();

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