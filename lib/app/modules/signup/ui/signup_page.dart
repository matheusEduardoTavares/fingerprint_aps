import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/permissions_user_enum.dart';
import 'package:fingerprint_aps/app/modules/signup/presenter/controller/signup_controller.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
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

  TextEditingController? _loginController;
  TextEditingController? _passwordController;
  PermissionsUserEnum? _permissionsUserEnum;

  @override 
  void initState() {
    super.initState();

    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _updatePermissionsUserEnum(PermissionsUserEnum newPermission) {
    setState(() {
      _permissionsUserEnum = newPermission;
    });
  }

  Future<void> _validateAndSendForm() async {
    if (_formKey.currentState!.validate() && _permissionsUserEnum != null) {
      final userViewModel = UserViewModel(
        login: _loginController!.text, 
        password: _passwordController!.text, 
        permissionsUserEnum: _permissionsUserEnum!,
      );
      widget._signupController.createUser(userViewModel: userViewModel);

      return;
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Arrume os campos em vermelho'),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                UserInfoForm(
                  formKey: _formKey,
                  loginController: _loginController!,
                  passwordController: _passwordController!,
                  updateDropdownValue: _updatePermissionsUserEnum,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    child: const Text('Cadastrar'),
                    onPressed: _validateAndSendForm,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}