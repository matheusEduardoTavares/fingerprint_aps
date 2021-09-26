import 'package:fingerprint_aps/app/core/helpers/images_helper.dart';
import 'package:fingerprint_aps/app/core/modules/auth/domain/entities/user.dart';
import 'package:fingerprint_aps/app/core/modules/auth/presenter/controller/auth_controller.dart';
import 'package:fingerprint_aps/app/core/widgets/user_info_form/user_info_form.dart';
import 'package:fingerprint_aps/app/modules/home/ui/widgets/home_content/home_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    required AuthController authController,
    Key? key,
  }) : 
  _authController = authController,
  super(key: key);

  final AuthController _authController;

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
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(_user.login),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                          permissionsUserEnum: _user.permissionsUserEnum,
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
                              onPressed: () {}, 
                              child: const Text('Atualizar dados')
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.fingerprint),
        onPressed: () {},
      ),
    );
  }
}