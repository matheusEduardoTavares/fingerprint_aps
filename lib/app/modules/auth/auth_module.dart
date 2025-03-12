import 'package:fingerprint_aps/app/core/modules/auth/data/drivers/get_user_driver_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/repositories/get_user_repository.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/usecases/get_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/drivers/get_user_driver.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/repositories/get_user_repository_impl.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/usecases/verify_is_logged_usecase.dart';
import 'package:fingerprint_aps/app/modules/auth/ui/auth_page.dart';
import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/home/home_module.dart';
import 'package:fingerprint_aps/app/modules/login/login_module.dart';
import 'package:fingerprint_aps/app/modules/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<GetUserDriver>(
          (i) => GetUserDriverImpl(localStorage: i()))
      ..addLazySingleton<GetUserRepository>(
          (i) => GetUserRepositoryImpl(getUserDriver: i()))
      ..addLazySingleton<GetUserUsecase>(
          (i) => GetUserUsecaseImpl(getUserRepository: i()))
      ..addLazySingleton(
        (i) => AuthController(getUserUsecase: i()),
      );
  }

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r
      ..child(Modular.initialRoute,
          child: (_) => AuthPage(
                authController: Modular.get(),
              ))
      ..module(RoutesDefinition.home, module: HomeModule())
      ..module(RoutesDefinition.login, module: LoginModule())
      ..module(RoutesDefinition.signup, module: SignupModule());
  }
}
