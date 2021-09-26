import 'package:fingerprint_aps/app/modules/home/data/drivers/home_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_user_logout_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_user_logout_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_user_logout_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_update_user_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_user_logout_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_user_logout_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/controller/home_controller.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_user_logout_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

   @override
   final List<Bind> binds = [

     Bind.lazySingleton<HomeUpdateUserDriver>((i) => HomeUpdateUserDriverImpl(localStorage: i())),
     Bind.lazySingleton<HomeUpdateUserRepository>((i) => HomeUpdateUserRepositoryImpl(homeUpdateUserDriver: i())),
     Bind.lazySingleton<HomeUpdateUserUsecase>((i) => HomeUpdateUserUsecaseImpl(homeUpdateUserRepository: i())),

     Bind.lazySingleton<HomeUserLogoutDriver>((i) => HomeUserLogoutDriverImpl(localStorage: i())),
     Bind.lazySingleton<HomeUserLogoutRepository>((i) => HomeUserLogoutRepositoryImpl(homeUserLogoutDriver: i())),
     Bind.lazySingleton<HomeUserLogoutUsecase>((i) => HomeUserLogoutUsecaseImpl(homeUserLogoutRepository: i())),
     
     Bind.lazySingleton((i) => HomeController(authController: i(), homeUpdateUserUsecase: i(), homeUserLogoutUsecase: i()))
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(authController: Modular.get(), homeController: Modular.get(),)),
   ];
}