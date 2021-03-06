import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/user_state.dart';
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
    return BlocListener<AuthController, UserState>(
      bloc: _authController..getUser(),
      listener: (_, state) {
        switch (state.user.authStatusEnum) {
          case AuthStatusEnum.empty:
            if (state.user.login.isNotEmpty) {
              Modular.to.popAndPushNamed('/auth${RoutesDefinition.login}');
            }
            else {
              Modular.to.popAndPushNamed('/auth${RoutesDefinition.signup}');
            }
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
      ),
    );
  }
}