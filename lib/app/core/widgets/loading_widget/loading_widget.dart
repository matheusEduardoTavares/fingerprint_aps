import 'package:fingerprint_aps/app/core/theme/definition_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({ 
    this.color,
    Key? key,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: color ?? DefinitionColors.primaryDarkColor,
      ),
    );
  }
}