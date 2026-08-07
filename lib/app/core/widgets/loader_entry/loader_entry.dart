import 'package:fingerprint_aps/app/core/theme/definition_colors.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';

class LoaderEntry {
  LoaderEntry();

  static OverlayEntry? _entry;
  static var _isOpen = false;

  static void show() {
    _entry ??= OverlayEntry(builder: (_) {
      return Container(
        color: Colors.black38,
        child: const Center(
          child: CircularProgressIndicator(
            color: DefinitionColors.primaryDarkColor,
          ),
        ),
      );
    });

    if (!_isOpen) {
      _isOpen = true;
      Asuka.addOverlay(_entry!);
    }
  }

  static void hide() {
    _isOpen = false;
    _entry?.remove();
  }
}
