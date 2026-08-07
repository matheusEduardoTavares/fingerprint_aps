import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/widgets/loader_entry/loader_entry.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/usecases/signup_usecase.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart';

class SignupController {
  SignupController({
    required SignupUsecase signupUsecase,
  }) : _signupUsecase = signupUsecase;

  final SignupUsecase _signupUsecase;
  final ValueNotifier<PermissionsUserEnum?> _permissionsUserEnum =
      ValueNotifier(null);

  PermissionsUserEnum? get permissionsUserEnum => _permissionsUserEnum.value;

  void updatePermissionUserEnum(PermissionsUserEnum permissionsUserEnum) {
    _permissionsUserEnum.value = permissionsUserEnum;
  }

  Future<void> createUser({
    required UserViewModel userViewModel,
  }) async {
    var formIsValid = true;
    final userPermission =
        userViewModel.permissionsUserEnum ?? permissionsUserEnum;

    if (!Environments.isTest) {
      FocusScope.of(userViewModel.context!).unfocus();

      formIsValid = userViewModel.formKey!.currentState!.validate();
    }

    if (formIsValid && userPermission != null) {
      final updatedUserViewModel = UserViewModel(
        login: userViewModel.login,
        password: userViewModel.password,
        permissionsUserEnum: userPermission,
      );

      try {
        if (!Environments.isTest) {
          LoaderEntry.show();
        }

        await _signupUsecase.createUser(updatedUserViewModel);

        if (!Environments.isTest) {
          LoaderEntry.hide();
          Modular.to.popAndPushNamed(RoutesDefinition.auth);
        }
      } catch (_) {
        if (Environments.isTest) {
          rethrow;
        }

        Asuka
          ..removeCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text('Um erro inesperado ocorreu'),
          ));
      }

      return;
    }

    if (!Environments.isTest) {
      ScaffoldMessenger.of(userViewModel.context!).removeCurrentSnackBar();
      ScaffoldMessenger.of(userViewModel.context!).showSnackBar(const SnackBar(
        content: Text('Arrume os campos em vermelho'),
      ));
    }
  }
}
