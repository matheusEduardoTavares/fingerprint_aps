import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/modules/auth/auth_module.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/loading_dependencies_modules.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override 
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoadingDependenciesModules()),
    ModuleRoute(RoutesDefinition.auth, module: AuthModule()),
  ];
}