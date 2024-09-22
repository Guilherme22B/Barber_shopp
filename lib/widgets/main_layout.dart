import 'package:flutter/material.dart';
import 'package:myapp/views/screen1/screen1_page.dart';
import 'package:myapp/views/screen2/screen2_page.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: const Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Tela 1'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen1Page()),
                );
              },
            ),
            ListTile(
              title: Text('Tela 2'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen2Page()),
                );
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
