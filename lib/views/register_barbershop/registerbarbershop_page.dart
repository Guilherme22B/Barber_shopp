import 'package:flutter/material.dart';
import 'package:myapp/widgets/main_layout.dart';
import 'RegisterForm.dart';

class RegisterbarbershopPage extends StatelessWidget {
  const RegisterbarbershopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SingleChildScrollView(
        // Adicionando rolagem vertical
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.5, left: 10),
                child: Text(
                  'Cadastre sua barbearia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 0), // Espaçamento entre o título e o formulário
            RegisterForm(), // Use o formulário aqui

            // Container para o texto de copyright com fundo vermelho
            Container(
              padding: const EdgeInsets.all(
                  10.0), // Adiciona padding dentro do Container
              color:
                  const Color.fromRGBO(26, 27, 31, 1), // Cor de fundo vermelha
              child: Align(
                alignment: Alignment.centerLeft, // Alinha o texto à esquerda
                child: Text(
                  "© 2023 Copyright FSW Barber",
                  style: TextStyle(
                    color:
                        const Color.fromRGBO(131, 136, 150, 1), // Cor do texto
                    fontSize: 10, // Tamanho do texto
                    fontWeight: FontWeight.w300, // Peso da fonte
                  ),
                ),
              ),
            ),
            SizedBox(height: 50), // Espaçamento abaixo do texto de copyright
          ],
        ),
      ),
    );
  }
}
