import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/views/home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // GlobalKey para controlar o estado do formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget loginForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B1F),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF26272B),
          width: 2,
        ),
      ),
      width: double.infinity,
      height: 320,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey, // Vinculando o formulário à chave global
          child: Column(
            children: [
              const Text(
                "Olá, Faça seu Login!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              // Campo de e-mail
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail:',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o e-mail';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Campo de senha
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a senha';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "É novo aqui? Crie a sua conta!",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              // Botão de envio
              SizedBox(
                width: 265,
                child: CupertinoButton(
                  color: const Color.fromRGBO(99, 47, 47, 1),
                  child: const Text(
                    "Confirmar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Se o formulário for válido, navegue para a página inicial
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF141518),
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.asset(
            'assets/images/Tittle.png',
            height: 90,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF141518),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/Barber-Logo.png',
                height: 200,
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: loginForm(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
