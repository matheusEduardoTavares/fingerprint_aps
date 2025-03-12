import 'package:fingerprint_aps/app/core/helpers/instances_helper.dart';
import 'package:fingerprint_aps/app/modules/home/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute,
        child: (_) => HomePage(
              authController: InstancesHelper.authController,
              homeController: InstancesHelper.homeController,
            ));
  }
}
