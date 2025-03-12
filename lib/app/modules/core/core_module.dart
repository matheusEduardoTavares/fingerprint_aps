import 'package:fingerprint_aps/app/core/fingerprint_auth/fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/fingerprint_auth/local_auth_fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/helpers/hive_helper.dart';
import 'package:fingerprint_aps/app/core/local_storage/hive_local_storage.dart';
import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addLazySingleton<LocalStorage>(
        (i) => HiveLocalStorage(boxKey: HiveHelper.userBoxKey),
      )
      ..addLazySingleton<FingerprintAuth>(
        (i) => LocalAuthFingerprintAuth(),
      );
  }
}
