import 'package:fingerprint_aps/app/core/navigation_service/navigation_service.dart';
import 'package:fingerprint_aps/app/core/routes_definition/routes_definition.dart';
import 'package:fingerprint_aps/app/core/theme/definition_colors.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_controller.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_enum.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_state.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/ui/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    required LoadingDependenciesController loadingDependenciesController,
    Key? key,
  })  : _loadingDependenciesController = loadingDependenciesController,
        super(key: key);

  final LoadingDependenciesController _loadingDependenciesController;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static var _initStateAlreadyWasExecuted = false;

  @override
  void initState() {
    super.initState();

    if (!_initStateAlreadyWasExecuted) {
      widget._loadingDependenciesController.execute();
      _initStateAlreadyWasExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoadingDependenciesController,
        LoadingDependenciesState>(
      bloc: widget._loadingDependenciesController,
      listener: (_, state) {
        switch (state.loadingDependenciesEnum) {
          case LoadingDependenciesEnum.stopped:
            break;
          case LoadingDependenciesEnum.loading:
            break;
          case LoadingDependenciesEnum.finished:
            Modular.setNavigatorKey(NavigationService.navigatorKey);
            Navigator.of(context).popAndPushNamed(RoutesDefinition.auth);
            break;
        }
      },
      child: const Scaffold(
        backgroundColor: DefinitionColors.primaryDarkColor,
        body: SplashWidget(),
      ),
    );
  }
}
