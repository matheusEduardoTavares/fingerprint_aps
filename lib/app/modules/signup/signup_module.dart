import 'package:fingerprint_aps/app/core/helpers/instances_helper.dart';
import 'package:fingerprint_aps/app/modules/signup/ui/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => SignupPage(
        signupController: InstancesHelper.signupController,
      ),
    );
  }
}
