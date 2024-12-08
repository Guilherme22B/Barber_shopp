import 'package:flutter/material.dart';
//import 'package:myapp/views/agendamento/agendamento_page.dart';
//import 'package:myapp/views/login/login_page.dart';
//import 'package:myapp/views/categoria/categoria_page.dart';
//import 'package:myapp/views/config/config_page.dart';
import 'package:myapp/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      //home: const CategoriaPage(),
      home: const HomePage(),
      //home: const LoginPage(),
      //home: const AgendamentoPage(),
      //home: const ConfigPage(),
    );
  }
}