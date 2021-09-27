import 'package:auto_size_text/auto_size_text.dart';
import 'package:fingerprint_aps/app/core/helpers/images_helper.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/user_state.dart';
import 'package:fingerprint_aps/app/core/widgets/user_info_form/user_info_form.dart';
import 'package:fingerprint_aps/app/modules/core/presenter/controller/view_models/user_view_model.dart';
import 'package:fingerprint_aps/app/modules/home/presenter/controller/home_controller.dart';
import 'package:fingerprint_aps/app/modules/home/ui/widgets/home_content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    required AuthController authController,
    required HomeController homeController,
    Key? key,
  }) : 
  _authController = authController,
  _homeController = homeController,
  super(key: key);

  final AuthController _authController;
  final HomeController _homeController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User get _user => widget._authController.state.user;

  final _selectedBarIndex = ValueNotifier<int>(0);

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late PermissionsUserEnum _permissionsUserEnum;

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController(text: _user.login);
    _passwordController = TextEditingController(text: _user.password);
    _permissionsUserEnum = _user.permissionsUserEnum;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthController, UserState?>(
      bloc: widget._authController,
      builder: (context, userState) {
        if (userState == null) {
          return const SizedBox(height: 0, width: 0,);
        }
      
        return Scaffold(
          appBar: AppBar(
            title: AutoSizeText(userState.user.login),
            actions: [
              IconButton(
                onPressed: () => widget._homeController.logout(),
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Stack(
            children: [
              Image.asset(
                ImagesHelper.nature,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ValueListenableBuilder(
                          valueListenable: _selectedBarIndex,
                          builder: (_, __, ___) => [
                            HomeContent(
                              permissionsUserEnum: userState.user.permissionsUserEnum,
                            ),
                            Column(
                              children: [
                                UserInfoForm(
                                  formKey: _formKey,
                                  loginController: _loginController,
                                  passwordController: _passwordController,
                                  updateDropdownValue: (newValue) {
                                    setState(() {
                                      _permissionsUserEnum = newValue;
                                    });
                                  },
                                  permissionsUserEnum: _permissionsUserEnum,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final userViewModel = UserViewModel(
                                      login: _loginController.text, 
                                      password: _passwordController.text, 
                                      permissionsUserEnum: _permissionsUserEnum,
                                    );
    
                                    widget._homeController.updateUser(userViewModel);
                                  }, 
                                  child: const Text('Atualizar dados')
                                ),
                                ElevatedButton(
                                  onPressed: () => widget._homeController.deleteAccount(), 
                                  child: const Text('Deletar conta')
                                ),
                              ],
                            ),
                          ][_selectedBarIndex.value],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: _selectedBarIndex,
            builder: (_, __, ___) => BottomNavigationBar(
              currentIndex: _selectedBarIndex.value,
              onTap: (newIndex) => _selectedBarIndex.value = newIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.nature_outlined),
                  label: 'Informações',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Dados',
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override 
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}