import 'package:flutter/material.dart';
import 'package:myapp/views/config/config_page.dart';
import 'package:myapp/views/home/home_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myapp/views/agendamento/agendamento_page.dart';
import 'package:myapp/views/categoria/categoria_page.dart';
import 'package:myapp/views/register_barbershop/registerbarbershop_page.dart';
import 'package:myapp/views/logout/logout_page.dart';
import 'package:myapp/views/login/login_page.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isSmallScreen = screenWidth < 600;
    return Scaffold(
      backgroundColor: const Color(0xFF141518),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141518),
        elevation: 0,
        centerTitle: false,
        title: Container(
          padding: EdgeInsets.only(top: isSmallScreen ? 10.0 : 20.0),
          child: Image.asset(
            'assets/images/Tittle.png',
            height: isSmallScreen ? 60 : 90, // Ajuste da altura do logo
          ),
        ),
      ),
      endDrawer: isSmallScreen
          ? Drawer(
              backgroundColor: const Color(0xFF1A1B1F),
              child: _buildDrawerContent(context),
            )
          : null, // Usando Drawer apenas para telas pequenas (celulares)
      body: body,
    );
  }

  Widget _buildDrawerContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Ação ao clicar no avatar
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Usuário Nome",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "usuario@email.com",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Início'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month_outlined),
          title: const Text('Agendamentos'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AgendamentoPage()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(MdiIcons.scissorsCutting),
          title: const Text('Crie Sua Barbearia'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterbarbershopPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.category_outlined),
          title: const Text('Categorias'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CategoriaPage()));
          },
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Configurações'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ConfigPage()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app, size: 30),
          title: const Text(
            'Sair',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LogoutPage()));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ],
    );
  }
}
