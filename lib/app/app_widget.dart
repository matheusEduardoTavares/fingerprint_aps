import 'package:fingerprint_aps/app/core/theme/default_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fingerprint APS',
      theme: DefaultThemeData.defaultThemeData,
    ).modular();
  }
}