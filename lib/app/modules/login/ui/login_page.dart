import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/core/widgets/user_info_form/user_info_form.dart';
import 'package:fingerprint_aps/app/modules/loading_dependencies/ui/widgets/splash_widget.dart';
import 'package:fingerprint_aps/app/modules/login/presenter/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ 
    required LoginController loginController,
    Key? key,
  }) : 
  _loginController = loginController,
  super(key: key);

  final LoginController _loginController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  @override 
  void initState() {
    super.initState();

    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: SplashWidget(),
              ),
              Column(
                children: [
                  UserInfoForm(
                    formKey: _formKey,
                    loginController: _loginController,
                    passwordController: _passwordController,
                  ),
                  ElevatedButton(
                    onPressed: () => widget._loginController.manuallyLogin(
                      userViewModel: UserViewModel(
                        context: context,
                        formKey: _formKey,
                        login: _loginController.text,
                        password: _passwordController.text,  
                      ),
                    ), 
                    child: const Text('Fazer Login')
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.fingerprint),
        onPressed: widget._loginController.authenticate,
      ),
    );
  }

  @override 
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}