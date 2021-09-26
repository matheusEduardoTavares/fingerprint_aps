import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/domain/usecases/loading_dependencies_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_controller.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/usecases/loading_dependencies_usecase.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/ui/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoadingDependenciesModules extends Module {
   @override
   final List<Bind> binds = [
     Bind.lazySingleton<LoadingDependenciesUsecase>((i) => LoadingDependenciesUsecaseImpl(fingerprintAuth: i())),
     Bind.lazySingleton((i) => LoadingDependenciesController(loadingDependenciesUsecase: i())),
   ];

   @override
   List<Module> get imports => [
     CoreModule(),
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage(loadingDependenciesController: Modular.get(),)),
   ];
}