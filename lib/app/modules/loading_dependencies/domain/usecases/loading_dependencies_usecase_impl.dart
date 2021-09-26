import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/usecases/loading_dependencies_usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoadingDependenciesUsecaseImpl implements LoadingDependenciesUsecase{
  @override
  Future<void> execute() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(AuthStatusEnumAdapter())
    ;
  }
}