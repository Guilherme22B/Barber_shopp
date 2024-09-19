import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    setState(() {
      _errorMessage = e.message; // A mensagem de erro correta
    });
  } catch (e) {
    setState(() {
      _errorMessage = 'Erro desconhecido: $e'; // Captura qualquer outro erro
    });
  }

  }

  Widget loginForm() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(37, 157, 158, 150),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 306,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Olá, faça seu login!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'E-mail:',
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: true,  // Para ocultar a senha
            decoration: const InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 10),
            Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ],
          const SizedBox(height: 10),
          const Text(
            "É novo aqui? Crie a sua conta!",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 298,
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
              onPressed: _login,  // Chama a função de login
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            loginForm(),
          ],
        ),
      ),
    );
  }
}
