import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/widgets/loader_entry/loader_entry.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/usecases/signup_usecase.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class SignupController {

  SignupController({
    required SignupUsecase signupUsecase,
  }) : 
  _signupUsecase = signupUsecase;

  final SignupUsecase _signupUsecase;

  Future<void> createUser({
    required UserViewModel userViewModel,
  }) async {
    try {
      if (!Environments.isTest) {
        LoaderEntry.show();
      }

      await _signupUsecase.createUser(userViewModel);

      if (!Environments.isTest) {
        LoaderEntry.hide();
        Modular.to.popAndPushNamed(RoutesDefinition.auth);
      }
    }
    catch (_) {
      if (Environments.isTest) {
        rethrow;
      }

      asuka.removeCurrentSnackBar();
      asuka.showSnackBar(
        const SnackBar(
          content: Text('Um erro inesperado ocorreu'),
        )
      );
    }
  }
}