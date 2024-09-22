import 'package:flutter/material.dart';
import 'package:myapp/widgets/main_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      body: Center(
        child: Text('Óla seja bem-vindo!'),
      ),
    );
  }
}
