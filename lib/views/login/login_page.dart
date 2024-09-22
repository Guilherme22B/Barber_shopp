import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/views/home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget loginForm(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(37, 157, 158, 150),
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: 306,
        alignment: Alignment.center,
        child: Column(children: [
          const SizedBox(height: 30),
          const Text(
            "Óla, faça seu login!",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          TextFormField(
              decoration: const InputDecoration(
            labelText: 'E-mail:',
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          )),
          const SizedBox(height: 20),
          TextFormField(
              decoration: const InputDecoration(
            labelText: 'Senha',
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          )),
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
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                // Navegar para a HomePage ao clicar no botão
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
        ]));
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
            loginForm(context),
          ],
        ),
      ),
    );
  }
}
