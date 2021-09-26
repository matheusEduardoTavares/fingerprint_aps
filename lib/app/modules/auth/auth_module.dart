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
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<GetUserDriver>((i) => GetUserDriverImpl(localStorage: i())),
    Bind.lazySingleton<GetUserRepository>((i) => GetUserRepositoryImpl(getUserDriver: i())),
    Bind.lazySingleton<GetUserUsecase>((i) => GetUserUsecaseImpl(getUserRepository: i())),
    Bind.lazySingleton((i) => AuthController(getUserUsecaseUsecase: i())),
  ];

   @override
  List<Module> get imports => [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage(authController: Modular.get(),)),
    ModuleRoute(RoutesDefinition.home, module: HomeModule()),
    ModuleRoute(RoutesDefinition.login, module: LoginModule()),
  ];
}