import 'package:fingerprint_aps/app/core/helpers/instances_helper.dart';
import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  // @override
  // void binds(Injector i) {
  //   i
  //     ..addLazySingleton<LoginFingerprintAuthenticateUsecase>(
  //         (i) => LoginFingerprintAuthenticateUsecaseImpl(fingerprintAuth: i()))
  //     ..addLazySingleton<LoginManuallyUsecase>(
  //         (i) => LoginManuallyUsecaseImpl(getUserRepository: i()))
  //     ..addLazySingleton<LoginUpdateUserDriver>((i) =>
  //         LoginUpdateUserDriverImpl(
  //             localStorage: InstancesHelper.localStorageInstance))
  //     ..addLazySingleton<LoginUpdateUserRepository>(
  //         (i) => LoginUpdateUserRepositoryImpl(loginUpdateUserDriver: i()))
  //     ..addLazySingleton<LoginUpdateUserUsecase>(
  //         (i) => LoginUpdateUserUsecaseImpl(loginUpdateUserRepository: i()))
  //     ..addLazySingleton<LoginManuallyUsecase>(
  //         (i) => LoginManuallyUsecaseImpl(getUserRepository: i()))
  //     ..addLazySingleton<LoginController>((i) => LoginController(
  //         loginFingerprintAuthenticateUsecase: i(),
  //         authController: i(),
  //         loginManuallyUsecase: i(),
  //         loginUpdateUserUsecase: i()));
  // }

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => LoginPage(
        loginController: InstancesHelper.loginController,
      ),
    );
  }
}
