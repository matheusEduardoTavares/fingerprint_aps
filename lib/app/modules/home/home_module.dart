import 'package:fingerprint_aps/app/modules/home/data/drivers/home_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/repositories/home_update_user_repository.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/drivers/home_update_user_driver.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/controller/home_controller.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/usecases/home_update_user_usecase.dart';
import 'package:fingerprint_aps/app/modules/home/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

   @override
   final List<Bind> binds = [
     Bind.lazySingleton<HomeUpdateUserDriver>((i) => HomeUpdateUserDriverImpl(localStorage: i())),
     Bind.lazySingleton<HomeUpdateUserRepository>((i) => HomeUpdateUserRepositoryImpl(homeUpdateUserDriver: i())),
     Bind.lazySingleton<HomeUpdateUserUsecase>((i) => HomeUpdateUserUsecaseImpl(homeUpdateUserRepository: i())),
     Bind.lazySingleton((i) => HomeController(authController: i(), homeUpdateUserUsecase: i()))
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => HomePage(authController: Modular.get(), homeController: Modular.get(),)),
   ];
}