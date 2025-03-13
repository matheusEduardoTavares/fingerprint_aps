import 'package:flutter/material.dart';

abstract class CodePush {
  Future<void> updateToNewVersion();
  Future<bool> valideNeedsUpdate();
  Future<void> showRestartAppAfterUpdateBottomSheet(BuildContext context);
}
