import 'package:fingerprint_aps/app/core/fingerprint_auth/fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/widgets/dialogs/simple_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:asuka/asuka.dart';

class LocalAuthFingerprintAuth implements FingerprintAuth {
  final _instance = LocalAuthentication();

  static var useBiometrics = false;

  void _showErrorDialog({String? title}) {
    Asuka.showDialog(
      builder: (_) => SimpleWarningDialog(
        title: title ??
            'Houve um erro inesperado ao buscar o recurso de biometria',
      ),
    );
  }

  @override
  Future<bool?> authenticate() async {
    if (!useBiometrics) {
      _showErrorDialog(
          title: 'Este dispositivo não permite o uso de biometria');

      return null;
    }

    try {
      final didAuthenticate = await _instance.authenticate(
        localizedReason: 'Faça o login via biometria ou preenchendo os dados',
      );

      return didAuthenticate;
    } on PlatformException catch (e) {
      if (e.code == 'LockedOut') {
        Asuka
          ..removeCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text('Muitas tentativas!! Aguarde ...'),
            behavior: SnackBarBehavior.floating,
          ));
      } else {
        _showErrorDialog();
      }
    } catch (_) {
      _showErrorDialog();
    }

    return null;
  }

  @override
  Future<bool> canUseBiometrics() async {
    final isDeviceSupported = await _instance.isDeviceSupported();
    final canCheckBiometrics = await _instance.canCheckBiometrics;
    return useBiometrics = isDeviceSupported && canCheckBiometrics;
  }
}
