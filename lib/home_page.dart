import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'info_pages.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({required this.username});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROMOS CU'),
        centerTitle: true,  // Centra el título en la AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1350379.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¡Bienvenido $username!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage(title: 'Little Caesars')),
                    );
                  },
                  child: Text('Little Caesars'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage(title: 'Burger King')),
                    );
                  },
                  child: Text('Burger King'),
                ),
				ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage(title: 'Escondida')),
                    );
                  },
                  child: Text('Escondida'),
                ),
					ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage(title: 'The Italian coffee')),
                    );
                  },
                  child: Text('The Italian coffee'),
                ),


                // Agrega más botones para navegar a otras páginas de información adicional si es necesario
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _logout(context),
                  child: Text('Cerrar Sesión'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

