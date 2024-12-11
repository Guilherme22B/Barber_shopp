import './firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importação do Firebase
// Descomente a linha correspondente à página que você deseja definir como inicial
// import 'package:myapp/views/agendamento/agendamento_page.dart';
import 'package:myapp/views/login/login_page.dart';
// import 'package:myapp/views/categoria/categoria_page.dart';
// import 'package:myapp/views/config/config_page.dart';
// import 'package:myapp/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Remove a bandeira de debug
      title: 'Login',  // Título do aplicativo
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,  // Cor de fundo da aplicação
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, 
          brightness: Brightness.dark
        ),
        useMaterial3: true,  // Utiliza o Material Design 3
      ),
      // Para mudar a página inicial, comente a linha atual e descomente a desejada
      // home: const HomePage(),  // Página inicial atual
      // home: const CategoriaPage(),
      home: LoginPage(),
      // home: const AgendamentoPage(),
      // home: const ConfigPage(),
    );
  }
}
