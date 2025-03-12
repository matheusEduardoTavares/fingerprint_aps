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
  void binds(Injector i) {
    i
      ..addLazySingleton<SignupDriver>(
          (i) => SignupDriverImpl(localStorage: i()))
      ..addLazySingleton<SignupRepository>(
          (i) => SignupRepositoryImpl(signupDriver: i()))
      ..addLazySingleton<SignupUsecase>(
          (i) => SignupUsecaseImpl(signupRepository: i()))
      ..addLazySingleton((i) => SignupController(signupUsecase: i()));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => SignupPage(
        signupController: Modular.get(),
      ),
    );
  }
}
