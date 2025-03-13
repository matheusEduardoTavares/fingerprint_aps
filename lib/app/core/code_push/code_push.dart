import 'package:flutter/material.dart';

abstract class CodePush {
  void updateToNewVersion();
  Future<bool> valideNeedsUpdate();
  Future<void> showRestartAppAfterUpdateBottomSheet(BuildContext context);
}
