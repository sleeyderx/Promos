import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String title;

  const InfoPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1345681.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              'Contenido de la página $title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

