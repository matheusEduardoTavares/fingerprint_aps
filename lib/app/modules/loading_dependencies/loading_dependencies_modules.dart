import 'package:fingerprint_aps/app/core/helpers/instances_helper.dart';
import 'package:fingerprint_aps/app/modules/core/core_module.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/domain/usecases/loading_dependencies_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_controller.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/ui/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoadingDependenciesModules extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => SplashPage(
        loadingDependenciesController: LoadingDependenciesController(
          loadingDependenciesUsecase: LoadingDependenciesUsecaseImpl(
            fingerprintAuth: InstancesHelper.fingerprintAuthInstance,
          ),
        ),
      ),
    );
  }
}
