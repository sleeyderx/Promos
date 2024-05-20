import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Aquí deberías verificar las credenciales, pero por ahora solo guardamos el usuario
    if (username.isNotEmpty && password.isNotEmpty) {
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      print('Credenciales inválidas');
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
                image: AssetImage('assets/images/1350383.png'),
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
                  onPressed: _login,
                  child: Text('Iniciar sesión'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
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

