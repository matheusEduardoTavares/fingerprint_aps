import 'package:fingerprint_aps/app/core/fingerprint_auth/local_auth_fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/helpers/local_storage_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/hive_local_storage.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/data/drivers/get_user_driver_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/usecases/get_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/repositories/get_user_repository_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/domain/usecases/loading_dependencies_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/controller/loading_dependencies_controller.dart';
import 'package:fingerprint_aps/app/modules/signup/data/drivers/signup_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/usecases/signup_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/infra/repositories/signup_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/controller/signup_controller.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';

void main() {
  SignupController? _signupController;
  LoadingDependenciesController? _loadDependenciesController;
  LocalStorage? _localStorage;
  AuthController? _authController;
  var _isLoadedDependencies = false;

  setUpAll(() => Environments.isTest = true);

  setUp(
    () async {
      _localStorage = HiveLocalStorage(
        boxKey: LocalStorageHelper.userKey,
      );

      _signupController = SignupController(
        signupUsecase: SignupUsecaseImpl(
          signupRepository: SignupRepositoryImpl(
            signupDriver: SignupDriverImpl(
              localStorage: _localStorage!,
            ),
          ),
        ),
      );

      _authController = AuthController(
        getUserUsecase: GetUserUsecaseImpl(
          getUserRepository: GetUserRepositoryImpl(
            getUserDriver: GetUserDriverImpl(
              localStorage: _localStorage!,
            )
          )
        )
      );

      _loadDependenciesController = LoadingDependenciesController(
        loadingDependenciesUsecase: LoadingDependenciesUsecaseImpl(
          fingerprintAuth: LocalAuthFingerprintAuth(),
        ),
      );

      if (!_isLoadedDependencies) {
        await _loadDependenciesController!.execute();
        _isLoadedDependencies = true;
      }
    }
  );

  group('Testing SignupModule', () {
    test('Verify if create user correctly', () async {
      ///Aqui ?? garantido excluir o usu??rio caso em algum outro teste tenha sido salvo no Hive
      await _localStorage!.clear();

      ///Aqui na hora de buscar o usu??rio, se foi deletado, claramente n??o deve retornar nada
      final userViewModel = UserViewModel(
        login: faker.person.name(), 
        password: faker.lorem.sentence(), 
        permissionsUserEnum: PermissionsUserEnum.values[faker.randomGenerator.integer(PermissionsUserEnum.values.length)],
      );
      
      await _signupController!.createUser(userViewModel: userViewModel);

      final user = await _authController!.getUser();

      expect(user?.isEqualViewModel(userViewModel) ?? false, true);
    });
  });
}