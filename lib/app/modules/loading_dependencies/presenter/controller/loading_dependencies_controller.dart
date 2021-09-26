import 'package:bloc/bloc.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_enum.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_state.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/usecases/loading_dependencies_usecase.dart';

class LoadingDependenciesController extends Cubit<LoadingDependenciesState>{
  LoadingDependenciesController({
    required LoadingDependenciesUsecase loadingDependenciesUsecase,
  }): 
  _loadingDependenciesUsecase = loadingDependenciesUsecase,
  super(LoadingDependenciesState.initial());

  final LoadingDependenciesUsecase _loadingDependenciesUsecase;

  Future<void> execute() async {
    emit(state.copyWith(loadingDependenciesEnum: LoadingDependenciesEnum.loading));

    await _loadingDependenciesUsecase.execute();

    emit(state.copyWith(loadingDependenciesEnum: LoadingDependenciesEnum.finished));
  }
}