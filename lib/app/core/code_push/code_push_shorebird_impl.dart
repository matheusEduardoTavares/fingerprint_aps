import 'package:fingerprint_aps/app/core/code_push/code_push.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class CodePushShorebirdImpl implements CodePush {
  static final _updater = ShorebirdUpdater();

  @override
  Future<void> updateToNewVersion() async {
    await _updater.update();
  }

  @override
  Future<bool> valideNeedsUpdate() async {
    final status = await _updater.checkForUpdate();

    if (status == UpdateStatus.outdated) {
      return true;
    }

    return false;
  }
}
