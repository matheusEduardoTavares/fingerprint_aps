import 'package:fingerprint_aps/app/modules/loading_dependencies/ui/widgets/splash_widget.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/controller/signup_controller.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/core/widgets/user_info_form/user_info_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ 
    required SignupController signupController,
    Key? key,
  }) : 
  _signupController = signupController,
  super(key: key);

  final SignupController _signupController;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
        title: const Text('Criar conta'),
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
                    updateDropdownValue: widget._signupController.updatePermissionUserEnum,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      child: const Text('Cadastrar'),
                      onPressed: () => widget._signupController.createUser(
                        userViewModel: UserViewModel(
                          login: _loginController.text, 
                          password: _passwordController.text, 
                          context: context,
                          formKey: _formKey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
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