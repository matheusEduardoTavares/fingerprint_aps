import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/hive_local_storage.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/data/drivers/get_user_driver_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/usecases/get_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/repositories/get_user_repository_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/domain/usecases/loading_dependencies_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthController? _authController;
  LoadingDependenciesController? _loadDependenciesController;
  LocalStorage? _localStorage;
  var _isLoadedDependencies = false;

  setUp(
    () async {
      _localStorage = HiveLocalStorage(
        boxKey: LocalStorageHelper.userKey,
      );

      _authController = AuthController(
        getUserUsecaseUsecase: GetUserUsecaseImpl(
          getUserRepository: GetUserRepositoryImpl(
            getUserDriver: GetUserDriverImpl(
              localStorage: _localStorage!,
            )
          )
        )
      );

      _loadDependenciesController = LoadingDependenciesController(
        loadingDependenciesUsecase: LoadingDependenciesUsecaseImpl(),
      );

      if (!_isLoadedDependencies) {
        await _loadDependenciesController!.execute();
        _isLoadedDependencies = true;
      }
    }
  );

  group('Testing AuthModule', () {
    test('Verify not found user', () async {
      ///Aqui é garantido excluir o usuário caso em algum outro teste tenha sido salvo no Hive
      await _localStorage!.clear();

      ///Aqui na hora de buscar o usuário, se foi deletado, claramente não deve retornar nada
      final user = await _authController!.getUser();

      expect(user, null);
    });

    test('Verify found user', () async {
      final userToCreate = User(
        authStatusEnum: AuthStatusEnum.logged,
        login: '1223',
        password: '54965965',
        permissionsUserEnum: PermissionsUserEnum.one,
      );

      ///Aqui é garantido adicionar um usuário
      await _localStorage!.write<User>(
        LocalStorageHelper.userKey, 
        userToCreate,
      );

      ///Aqui na hora de buscar o usuário, se foi deletado, claramente não deve retornar nada
      final user = await _authController!.getUser();

      final isEqualAttributes = userToCreate.authStatusEnum == user?.authStatusEnum && 
        userToCreate.login == user?.login && userToCreate.password == user?.password &&
          userToCreate.permissionsUserEnum == user?.permissionsUserEnum;

      expect(isEqualAttributes, true);
    });
  });
}