abstract class FingerprintAuth {
  Future<bool> canUseBiometrics();

  Future<bool?> authenticate();
}