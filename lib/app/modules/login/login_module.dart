import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_fingerprint_authenticate_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_manually_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/controller/login_controller.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_fingerprint_authenticate_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/usecases/login_manually_usecase.dart';
import 'package:fingerprint_aps/app/modules/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
   @override
   final List<Bind> binds = [
     Bind.lazySingleton<LoginFingerprintAuthenticateUsecase>((i) => LoginFingerprintAuthenticateUsecaseImpl(fingerprintAuth: i())),
     Bind.lazySingleton<LoginManuallyUsecase>((i) => LoginManuallyUsecaseImpl(getUserRepository: i())),
     Bind.lazySingleton((i) => LoginController(loginFingerprintAuthenticateUsecase: i(), authController: i(), loginManuallyUsecase: i()))
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