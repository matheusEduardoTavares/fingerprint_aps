import 'package:fingerprint_aps/app/core/fingerprint_auth/fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/helpers/environments.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/auth_status_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/presenter/usecases/loading_dependencies_usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoadingDependenciesUsecaseImpl implements LoadingDependenciesUsecase {

  LoadingDependenciesUsecaseImpl({
    required FingerprintAuth fingerprintAuth,
  }) : 
  _fingerprintAuth = fingerprintAuth;

  final FingerprintAuth _fingerprintAuth;

  @override
  Future<void> execute() async {
    if (!Environments.isTest) {
      await _fingerprintAuth.canUseBiometrics();
    }

    await Hive.initFlutter();
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(AuthStatusEnumAdapter())
      ..registerAdapter(PermissionsUserEnumAdapter())
    ;
  }
}