import 'package:fingerprint_aps/app/core/fingerprint_auth/local_auth_fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/hive_local_storage.dart';
import 'package:fingerprint_aps/app/core/modules/auth/data/drivers/get_user_driver_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/usecases/get_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/infra/repositories/get_user_repository_impl.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_user_delete_account_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/data/drivers/home_user_logout_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_user_delete_account_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/domain/usecases/home_user_logout_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_user_delete_account_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/infra/repositories/home_user_logout_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/controller/home_controller.dart';
import 'package:fingerprint_aps/app/modules/login/data/drivers/login_update_user_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_fingerprint_authenticate_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_manually_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/domain/usecases/login_update_user_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/login/infra/repositories/login_update_user_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/controller/login_controller.dart';
import 'package:fingerprint_aps/app/modules/signup/data/drivers/signup_driver_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/domain/usecases/signup_usecase_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/infra/repositories/signup_repository_impl.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/controller/signup_controller.dart';

abstract class InstancesHelper {
  static final localStorageInstance =
      HiveLocalStorage(boxKey: HiveHelper.userBoxKey);
  static final getUserRepositoryInstance = GetUserRepositoryImpl(
    getUserDriver: GetUserDriverImpl(localStorage: localStorageInstance),
  );
  static final fingerprintAuthInstance = LocalAuthFingerprintAuth();
  static final authController = AuthController(
    getUserUsecase: GetUserUsecaseImpl(
      getUserRepository: getUserRepositoryInstance,
    ),
  );
  static final homeController = HomeController(
    authController: authController,
    homeUpdateUserUsecase: HomeUpdateUserUsecaseImpl(
      homeUpdateUserRepository: HomeUpdateUserRepositoryImpl(
        homeUpdateUserDriver:
            HomeUpdateUserDriverImpl(localStorage: localStorageInstance),
      ),
    ),
    homeUserLogoutUsecase: HomeUserLogoutUsecaseImpl(
      homeUserLogoutRepository: HomeUserLogoutRepositoryImpl(
        homeUserLogoutDriver:
            HomeUserLogoutDriverImpl(localStorage: localStorageInstance),
      ),
    ),
    homeUserDeleteAccountUsecase: HomeUserDeleteAccountUsecaseImpl(
      homeUserDeleteAccountRepository: HomeUserDeleteAccountRepositoryImpl(
        homeUserDeleteAccountDriver:
            HomeUserDeleteAccountDriverImpl(localStorage: localStorageInstance),
      ),
    ),
  );
  static final loginController = LoginController(
    loginFingerprintAuthenticateUsecase:
        LoginFingerprintAuthenticateUsecaseImpl(
            fingerprintAuth: fingerprintAuthInstance),
    authController: authController,
    loginManuallyUsecase:
        LoginManuallyUsecaseImpl(getUserRepository: getUserRepositoryInstance),
    loginUpdateUserUsecase: LoginUpdateUserUsecaseImpl(
      loginUpdateUserRepository: LoginUpdateUserRepositoryImpl(
        loginUpdateUserDriver: LoginUpdateUserDriverImpl(
          localStorage: localStorageInstance,
        ),
      ),
    ),
  );
  static final signupController = SignupController(
    signupUsecase: SignupUsecaseImpl(
      signupRepository: SignupRepositoryImpl(
        signupDriver: SignupDriverImpl(
          localStorage: localStorageInstance,
        ),
      ),
    ),
  );
}
