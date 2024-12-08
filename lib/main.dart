import 'package:flutter/material.dart';
<<<<<<< HEAD
//import 'package:myapp/views/agendamento/agendamento_page.dart';
//import 'package:myapp/views/book/book_page.dart';
//import 'package:myapp/views/login/login_page.dart'; 
//import 'package:myapp/views/categoria/categoria_page.dart';
//import 'package:myapp/views/config/config_page.dart';
import 'package:myapp/views/home/home_page.dart';
=======
import 'package:myapp/views/login/login_page.dart';
>>>>>>> 406bda197f05c598e3e70cb5ddecdca1afb3a51d

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
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
      //home: const BookPage(),
      //home: const ConfigPage(),
    );
=======
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: LoginPage());
>>>>>>> 406bda197f05c598e3e70cb5ddecdca1afb3a51d
  }
}
