import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/widgets/loading_widget/loading_widget.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_state.dart';
import 'package:fingerprint_aps/app/modules/auth/presenter/controller/auth_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({ 
    required AuthController authController,
    Key? key 
  }) : 
  _authController = authController,
  super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthController, AuthState>(
      bloc: _authController..verifyIsLogged(),
      listener: (_, state) {
        switch (state.authStatusEnum) {
          case AuthStatusEnum.empty:
            break;
          case AuthStatusEnum.logged:
            Modular.to.popAndPushNamed('/auth${RoutesDefinition.home}');
            break;
          case AuthStatusEnum.unlogged:
            Modular.to.popAndPushNamed('/auth${RoutesDefinition.login}');
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carregando ...'),
        ),
        body: const LoadingWidget(),
      ),
    );
  }
}