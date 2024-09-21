import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

void main() {
  runApp(const MyApp());
  // Commit de teste
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
