import 'package:fingerprint_aps/app/core/helpers/instances_helper.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/modules/auth/ui/auth_page.dart';
import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/home/home_module.dart';
import 'package:fingerprint_aps/app/modules/login/login_module.dart';
import 'package:fingerprint_aps/app/modules/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r
      ..child(Modular.initialRoute,
          child: (_) => AuthPage(
                authController: InstancesHelper.authController,
              ))
      ..module(RoutesDefinition.home, module: HomeModule())
      ..module(RoutesDefinition.login, module: LoginModule())
      ..module(RoutesDefinition.signup, module: SignupModule());
  }
}
