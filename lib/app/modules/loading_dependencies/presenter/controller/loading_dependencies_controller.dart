import 'package:bloc/bloc.dart';
import 'package:fingerprint_aps/app/core/code_push/code_push.dart';
import 'package:fingerprint_aps/app/core/code_push/code_push_shorebird_impl.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_enum.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_state.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/usecases/loading_dependencies_usecase.dart';

class LoadingDependenciesController extends Cubit<LoadingDependenciesState> {
  LoadingDependenciesController({
    required LoadingDependenciesUsecase loadingDependenciesUsecase,
    CodePush? codePush,
  })  : _loadingDependenciesUsecase = loadingDependenciesUsecase,
        _codePush = codePush ?? CodePushShorebirdImpl(),
        super(LoadingDependenciesState.initial());

  final LoadingDependenciesUsecase _loadingDependenciesUsecase;
  final CodePush _codePush;

  Future<void> execute() async {
    emit(state.copyWith(
        loadingDependenciesEnum: LoadingDependenciesEnum.loading));

    await _loadingDependenciesUsecase.execute();

    final shouldUpdateApp = await _codePush.valideNeedsUpdate();
    if (shouldUpdateApp) {
      await _codePush.updateToNewVersion();
    }

    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(
        loadingDependenciesEnum: LoadingDependenciesEnum.finished));
  }
}
