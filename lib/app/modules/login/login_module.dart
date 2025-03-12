import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/login/data/drivers/login_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/repositories/login_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_fingerprint_authenticate_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_manually_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/infra/repositories/drivers/login_update_user_driver.dart';
import 'package:fingerprint_aps/app/modules/login/infra/repositories/login_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/controller/login_controller.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_fingerprint_authenticate_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_manually_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_update_user_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<LoginFingerprintAuthenticateUsecase>(
          (i) => LoginFingerprintAuthenticateUsecaseImpl(fingerprintAuth: i()))
      ..addLazySingleton<LoginManuallyUsecase>(
          (i) => LoginManuallyUsecaseImpl(getUserRepository: i()))
      ..addLazySingleton<LoginUpdateUserDriver>(
          (i) => LoginUpdateUserDriverImpl(localStorage: i()))
      ..addLazySingleton<LoginUpdateUserRepository>(
          (i) => LoginUpdateUserRepositoryImpl(loginUpdateUserDriver: i()))
      ..addLazySingleton<LoginUpdateUserUsecase>(
          (i) => LoginUpdateUserUsecaseImpl(loginUpdateUserRepository: i()))
      ..addLazySingleton<LoginManuallyUsecase>(
          (i) => LoginManuallyUsecaseImpl(getUserRepository: i()))
      ..addLazySingleton((i) => LoginController(
          loginFingerprintAuthenticateUsecase: i(),
          authController: i(),
          loginManuallyUsecase: i(),
          loginUpdateUserUsecase: i()));
  }

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => LoginPage(
        loginController: Modular.get(),
      ),
    );
  }
}
