import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/widgets/loader_entry/loader_entry.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_fingerprint_authenticate_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_manually_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_update_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class LoginController {
  LoginController({
    required LoginFingerprintAuthenticateUsecase loginFingerprintAuthenticateUsecase,
    required AuthController authController,
    required LoginManuallyUsecase loginManuallyUsecase,
    required LoginUpdateUserUsecase loginUpdateUserUsecase,
  }) : 
  _authController = authController,
  _loginManuallyUsecase = loginManuallyUsecase,
  _loginUpdateUserUsecase = loginUpdateUserUsecase,
  _loginFingerprintAuthenticateUsecase = loginFingerprintAuthenticateUsecase;

  final AuthController _authController;
  final LoginFingerprintAuthenticateUsecase _loginFingerprintAuthenticateUsecase;
  final LoginManuallyUsecase _loginManuallyUsecase;
  final LoginUpdateUserUsecase _loginUpdateUserUsecase;

  Future<void> _makeLogin() async {
    final loggedUser = await _authController.getUser();

    final newUser = loggedUser!.copyWith(
      authStatusEnum: AuthStatusEnum.logged,
    );

    await _loginUpdateUserUsecase.updateUser(newUser);

    _authController.updateUserState(newUser);

    await Future.delayed(const Duration(seconds: 1));

    Modular.to.popAndPushNamed(RoutesDefinition.auth);
  }

  Future<void> authenticate() async {
    final didAuthenticate = await _loginFingerprintAuthenticateUsecase.authenticate();

    if (didAuthenticate != null && didAuthenticate) {
      await _makeLogin();
    }
  }

  Future<void> manuallyLogin(UserViewModel userData) async {
    if (!Environments.isTest) {
      LoaderEntry.show();
    }

    final canMakeLogin = await _loginManuallyUsecase.doLogin(userData);

    if (canMakeLogin != null && canMakeLogin) {
      await _makeLogin();
    }
    else {
      asuka.removeCurrentSnackBar();
      asuka.showSnackBar(
        const SnackBar(
          content: Text('Login ou Senha inválidos'),
        )
      );
    }

    if (!Environments.isTest) {
      LoaderEntry.hide();
    }
  }
}