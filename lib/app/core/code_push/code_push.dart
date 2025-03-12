abstract class CodePush {
  Future<void> updateToNewVersion();
  Future<bool> valideNeedsUpdate();
}
