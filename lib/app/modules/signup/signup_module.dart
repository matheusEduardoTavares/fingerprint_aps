import 'package:fingerprint_aps/app/modules/signup/data/drivers/signup_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/repositories/signup_repository.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/usecases/signup_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/infra/drivers/signup_driver.dart';
import 'package:fingerprint_aps/app/modules/signup/infra/repositories/signup_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/controller/signup_controller.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/usecases/signup_usecase.dart';
import 'package:fingerprint_aps/app/modules/signup/ui/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupModule extends Module {

   @override
   final List<Bind> binds = [
     Bind.lazySingleton<SignupDriver>((i) => SignupDriverImpl(localStorage: i())),
     Bind.lazySingleton<SignupRepository>((i) => SignupRepositoryImpl(signupDriver: i())),
     Bind.lazySingleton<SignupUsecase>((i) => SignupUsecaseImpl(signupRepository: i())),
     Bind.lazySingleton((i) => SignupController(signupUsecase: i())),
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => SignupPage(signupController: Modular.get(),)),
   ];

}