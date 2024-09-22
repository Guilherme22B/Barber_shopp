import 'package:flutter/material.dart';
import '../../widgets/main_layout.dart';

class Screen2Page extends StatelessWidget {
  const Screen2Page({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      body: Center(
        child: Text('Conteúdo da Tela 2'),
      ),
    );
  }
}
