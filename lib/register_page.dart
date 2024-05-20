import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Aquí podrías realizar la lógica de registro, pero por ahora solo guardamos el usuario
    if (username.isNotEmpty && password.isNotEmpty) {
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      print('Complete todos los campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1339175.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

