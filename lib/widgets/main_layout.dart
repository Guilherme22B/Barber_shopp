import 'package:flutter/material.dart';
import 'package:myapp/views/screen1/screen1_page.dart';
import 'package:myapp/views/agendamento/agendamento_page.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.asset(
            'assets/images/Tittle.png',
            height: 90,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: const Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.black,
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
              title: Text('Agendamento 1'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AgendamentoPage()),
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
