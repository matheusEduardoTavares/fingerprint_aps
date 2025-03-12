import 'package:fingerprint_aps/app/modules/home/data/drivers/home_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_user_delete_account_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_user_logout_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_delete_account_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_logout_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_user_delete_account_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_user_logout_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_update_user_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_delete_account_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_logout_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_user_delete_account_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_user_logout_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/controller/home_controller.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_delete_account_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_logout_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<HomeUpdateUserDriver>(
          (i) => HomeUpdateUserDriverImpl(localStorage: i()))
      ..addLazySingleton<HomeUpdateUserRepository>(
          (i) => HomeUpdateUserRepositoryImpl(homeUpdateUserDriver: i()))
      ..addLazySingleton<HomeUpdateUserUsecase>(
          (i) => HomeUpdateUserUsecaseImpl(homeUpdateUserRepository: i()))
      ..addLazySingleton<HomeUserLogoutDriver>(
          (i) => HomeUserLogoutDriverImpl(localStorage: i()))
      ..addLazySingleton<HomeUserLogoutRepository>(
          (i) => HomeUserLogoutRepositoryImpl(homeUserLogoutDriver: i()))
      ..addLazySingleton<HomeUserLogoutUsecase>(
          (i) => HomeUserLogoutUsecaseImpl(homeUserLogoutRepository: i()))
      ..addLazySingleton<HomeUserDeleteAccountDriver>(
          (i) => HomeUserDeleteAccountDriverImpl(localStorage: i()))
      ..addLazySingleton<HomeUserDeleteAccountRepository>((i) =>
          HomeUserDeleteAccountRepositoryImpl(homeUserDeleteAccountDriver: i()))
      ..addLazySingleton<HomeUserDeleteAccountUsecase>((i) =>
          HomeUserDeleteAccountUsecaseImpl(
              homeUserDeleteAccountRepository: i()))
      ..addLazySingleton(
        (i) => HomeController(
            authController: i(),
            homeUpdateUserUsecase: i(),
            homeUserLogoutUsecase: i(),
            homeUserDeleteAccountUsecase: i()),
      );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute,
        child: (_) => HomePage(
              authController: Modular.get(),
              homeController: Modular.get(),
            ));
  }
}
