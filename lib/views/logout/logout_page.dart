import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 1), // Fundo preto
      body: Center(
        child: Container(
          width: 300, // Largura reduzida
          padding: const EdgeInsets.all(20), // Espaçamento interno
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 38, 38, 43), // Fundo cinza escuro
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sair', // Título "Sair"
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Espaço entre título e mensagem
              const Text(
                'Deseja mesmo sair da plataforma?', // Mensagem de confirmação
                style: TextStyle(
                  color: Color.fromARGB(255, 170, 170, 170),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), // Espaço entre mensagem e botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Ação para cancelar
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(37, 17, 19, 0), // Cor do botão "Cancelar"
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Tamanho do botão
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 16, // Tamanho da fonte do botão
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Ação para sair
                      print("Usuário saiu da plataforma.");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(239, 68, 68, 1), // Cor do botão "Sair"
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Tamanho do botão
                    ),
                    child: const Text(
                      'Sair',
                      style: TextStyle(
                        fontSize: 16, // Tamanho da fonte do botão
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
