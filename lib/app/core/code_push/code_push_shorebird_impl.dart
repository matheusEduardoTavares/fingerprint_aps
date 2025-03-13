import 'package:fingerprint_aps/app/core/code_push/code_push.dart';
import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class CodePushShorebirdImpl implements CodePush {
  static final _updater = ShorebirdUpdater();

  @override
  void updateToNewVersion() {
    _updater.update();
  }

  @override
  Future<bool> valideNeedsUpdate() async {
    final status = await _updater.checkForUpdate();
    return status == UpdateStatus.outdated;
  }

  @override
  Future<void> showRestartAppAfterUpdateBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Uma nova atualização foi baixada!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Para aplicá-la, basta fechar e abrir o aplicativo novamente.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
