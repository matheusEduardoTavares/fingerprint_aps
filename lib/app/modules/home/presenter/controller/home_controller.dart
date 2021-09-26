import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/widgets/loader_entry/loader_entry.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class HomeController {
  HomeController({
    required AuthController authController,
    required HomeUpdateUserUsecase homeUpdateUserUsecase,
  }) : 
  _authController = authController,
  _homeUpdateUserUsecase = homeUpdateUserUsecase;

  final AuthController _authController;
  final HomeUpdateUserUsecase _homeUpdateUserUsecase;

  Future<void> updateUser(UserViewModel userData) async {
    if (_authController.state.user.isEqualViewModel(userData)) {
      asuka.removeCurrentSnackBar();
      asuka.showSnackBar(
        const SnackBar(
          content: Text('Nenhum dado foi alterado'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 70.0),
        )
      );

      return;
    }

    if (!Environments.isTest) {
      LoaderEntry.show();
    }

    final updatedUser = await _homeUpdateUserUsecase.updateUser(userData);

    if (updatedUser != null) {
      _authController.updateUserState(updatedUser);
    }

    if (!Environments.isTest) {
      LoaderEntry.hide();
    }
  }
}