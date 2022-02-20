import 'package:fingerprint_aps/app/core/fingerprint_auth/fingerprint_auth.dart';
import 'package:fingerprint_aps/app/core/widgets/dialogs/simple_warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:asuka/asuka.dart' as asuka;

class LocalAuthFingerprintAuth implements FingerprintAuth {
  final _instance = LocalAuthentication();

  static var useBiometrics = false;

  void _showErrorDialog({String? title}) {
    asuka.showDialog(
      builder: (_) => SimpleWarningDialog(
        title: title ?? 'Houve um erro inesperado ao buscar o recurso de biometria',
      ),
    );
  }

  @override
  Future<bool?> authenticate() async {
    if (!useBiometrics) {
      _showErrorDialog(title: 'Este dispositivo não permite o uso de biometria');

      return null;
    }

    try {
      final didAuthenticate = await _instance.authenticate(
        androidAuthStrings: const AndroidAuthMessages(
          biometricHint: 'Verificador de identidade',
          signInTitle: 'Use a biometria para fazer o login',
          cancelButton: 'Cancelar',
        ),
        localizedReason: 'Faça o login via biometria ou preenchendo os dados',
        biometricOnly: true,
      );

      return didAuthenticate;
    } on PlatformException catch(e) {
      if (e.code == 'LockedOut') {
        asuka.removeCurrentSnackBar();
        asuka.showSnackBar(
          const SnackBar(
            content: Text('Muitas tentativas!! Aguarde ...'),
            behavior: SnackBarBehavior.floating,
          )
        );
      }
      else {
        _showErrorDialog();
      }
    }
    catch (_) {
      _showErrorDialog();
    } 

    return null;
  }

  @override
  Future<bool> canUseBiometrics() async {
    return useBiometrics = await _instance.canCheckBiometrics;
  }
}