import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ 
    required AuthController authController,
    Key? key,
  }) : 
  _authController = authController,
  super(key: key);

  final AuthController _authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Text('User: ${_authController.state.user}'),
    );
  }
}