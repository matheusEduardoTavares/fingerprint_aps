import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_enum.dart';

class LoadingDependenciesState {
  LoadingDependenciesState({
    required this.loadingDependenciesEnum,
  });

  factory LoadingDependenciesState.initial() => 
    LoadingDependenciesState(loadingDependenciesEnum: LoadingDependenciesEnum.stopped);

  final LoadingDependenciesEnum loadingDependenciesEnum;

  LoadingDependenciesState copyWith({
    LoadingDependenciesEnum? loadingDependenciesEnum,
  }) {
    return LoadingDependenciesState(
      loadingDependenciesEnum: loadingDependenciesEnum ?? this.loadingDependenciesEnum,
    );
  }
}
