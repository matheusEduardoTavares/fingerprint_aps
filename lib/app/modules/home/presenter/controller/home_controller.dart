import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:fingerprint_aps/app/core/widgets/dialogs/simple_warning_dialog.dart';
import 'package:fingerprint_aps/app/core/widgets/loader_entry/loader_entry.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_delete_account_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_logout_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController {
  HomeController({
    required AuthController authController,
    required HomeUpdateUserUsecase homeUpdateUserUsecase,
    required HomeUserLogoutUsecase homeUserLogoutUsecase,
    required HomeUserDeleteAccountUsecase homeUserDeleteAccountUsecase,
  }) : 
  _authController = authController,
  _homeUserLogoutUsecase = homeUserLogoutUsecase,
  _homeUserDeleteAccountUsecase = homeUserDeleteAccountUsecase,
  _homeUpdateUserUsecase = homeUpdateUserUsecase;

  final AuthController _authController;
  final HomeUpdateUserUsecase _homeUpdateUserUsecase;
  final HomeUserLogoutUsecase _homeUserLogoutUsecase;
  final HomeUserDeleteAccountUsecase _homeUserDeleteAccountUsecase;
  final ValueNotifier<PermissionsUserEnum?> _permissionsUserEnum = ValueNotifier(null);

  PermissionsUserEnum? get permissionsUserEnum => _permissionsUserEnum.value;

  void initializePermissionUserEnum() {
    _permissionsUserEnum.value = _authController.state.user.permissionsUserEnum;
  }

  Future<void> updateUser({
    required UserViewModel userViewModel,
  }) async {

    FocusScope.of(userViewModel.context!).unfocus();
    if (userViewModel.formKey!.currentState!.validate()) {
      final updatedUserViewModel = UserViewModel(
        login: userViewModel.login, 
        password: userViewModel.password, 
        permissionsUserEnum: permissionsUserEnum,
      );

      if (_authController.state.user.isEqualViewModel(updatedUserViewModel)) {
        asuka.showDialog(
          builder: (_) => const SimpleWarningDialog(
            content: 'Nenhum dado foi alterado',
            title: 'Aviso',
          )
        );

        return;
      }

      if (!Environments.isTest) {
        LoaderEntry.show();
      }

      final updatedUser = await _homeUpdateUserUsecase.updateUser(updatedUserViewModel);

      if (updatedUser != null) {
        _authController.updateUserState(updatedUser);
      }

      if (!Environments.isTest) {
        LoaderEntry.hide();

        asuka.showDialog(
          builder: (_) => const SimpleWarningDialog(
            content: 'Dados atualizados com sucesso!!',
            title: 'Aviso',
          )
        );
      }

      return;
    }

    ScaffoldMessenger.of(userViewModel.context!).removeCurrentSnackBar();
    ScaffoldMessenger.of(userViewModel.context!).showSnackBar(
      const SnackBar(
        content: Text('Arrume os campos em vermelho'),
      )
    );
  }

  void updatePermissionEnum(PermissionsUserEnum permissionsUserEnum) {
    _permissionsUserEnum.value = permissionsUserEnum;
  }

  Future<void> logout() async {
    final confirmLogout = await asuka.showDialog<bool>(
      builder: (_) => const ConfirmDialog(
        title: 'Deseja mesmo fazer o logout?',
      ),
    );

    if (confirmLogout == null || !confirmLogout) {
      return;
    }

    await _homeUserLogoutUsecase.logout();

    if (!Environments.isTest) {
      Modular.to.popAndPushNamed(RoutesDefinition.auth);
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final confirmDelete = await asuka.showDialog<bool>(
      builder: (_) => const ConfirmDialog(
        title: 'Deseja mesmo deletar a conta?',
        content: 'A operação NÃO poderá ser desfeita!!',
      ),
    );

    if (confirmDelete == null || !confirmDelete) {
      return;
    }

    await _homeUserDeleteAccountUsecase.deleteAccount();

    if (!Environments.isTest) {
      Modular.to.popAndPushNamed(RoutesDefinition.auth);

      asuka.removeCurrentSnackBar();
      asuka.showSnackBar(
        const SnackBar(
          content: Text('Conta deletada com sucesso!!'),
          behavior: SnackBarBehavior.floating,
        )
      );
    }
  }
}