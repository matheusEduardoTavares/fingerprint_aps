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
   final List<Bind> binds = [
     Bind.lazySingleton<LoginFingerprintAuthenticateUsecase>((i) => LoginFingerprintAuthenticateUsecaseImpl(fingerprintAuth: i())),
     Bind.lazySingleton<LoginManuallyUsecase>((i) => LoginManuallyUsecaseImpl(getUserRepository: i())),

     Bind.lazySingleton<LoginUpdateUserDriver>((i) => LoginUpdateUserDriverImpl(localStorage: i())),
     Bind.lazySingleton<LoginUpdateUserRepository>((i) => LoginUpdateUserRepositoryImpl(loginUpdateUserDriver: i())),
     Bind.lazySingleton<LoginUpdateUserUsecase>((i) => LoginUpdateUserUsecaseImpl(loginUpdateUserRepository: i())),
     Bind.lazySingleton((i) => LoginController(loginFingerprintAuthenticateUsecase: i(), authController: i(), loginManuallyUsecase: i(), loginUpdateUserUsecase: i()))
   ];

   @override
   List<Module> get imports => [
     CoreModule(),
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage(loginController: Modular.get(),)),
   ];
}