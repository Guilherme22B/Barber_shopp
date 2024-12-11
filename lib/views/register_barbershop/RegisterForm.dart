import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'RegisterLocation.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeLojaController = TextEditingController();
  final TextEditingController _nomeCompletoController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _localizacaoController = TextEditingController();
  final TextEditingController _sobreController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  String? _servicoSelecionado;
  final List<String> _tiposServico = ['Cabelo', 'Barba', 'Ambos'];
  String? _imagemSelecionada;

  final List<Map<String, String>> _imagens = [
    {
      'url': 'https://media.istockphoto.com/id/1030246848/pt/foto/smiling-barber-cutting-customers-hair-in-salon.jpg?s=612x612&w=0&k=20&c=_voqVow-XK8vY0NYJn-g_fKrsvlh89atrCu4xffivBI=',
      'titulo': 'Imagem 1'
    },
    {
      'url': 'https://www20.opovo.com.br/images/app/noticia_132346504881/2017/11/29/3681105/Barbeariasmateria.jpg',
      'titulo': 'Imagem 2'
    },
    {
      'url': 'https://diaonline.ig.com.br/wp-content/uploads/2020/06/barbearia-em-jatai-opcoes-com-servicos-da-mais-alta-qualidade.jpg',
      'titulo': 'Imagem 3'
    }
  ];

  Future<void> _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          await FirebaseFirestore.instance.collection('barbearias').add({
            'nomeLoja': _nomeLojaController.text.trim(),
            'nomeCompleto': _nomeCompletoController.text.trim(),
            'cpf': _cpfController.text.trim(),
            'cnpj': _cnpjController.text.trim(),
            'localizacao': _localizacaoController.text.trim(),
            'sobre': _sobreController.text.trim(),
            'numero': _numeroController.text.trim(),
            'servico': _servicoSelecionado ?? '',
            'imagemPrincipal': _imagemSelecionada ?? '',
            'proprietarioId': user.uid,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Barbearia criada com sucesso!')),
          );

          // Limpar os campos após o registro
          _nomeLojaController.clear();
          _nomeCompletoController.clear();
          _cpfController.clear();
          _cnpjController.clear();
          _localizacaoController.clear();
          _sobreController.clear();
          _numeroController.clear();
          setState(() {
            _servicoSelecionado = null;
            _imagemSelecionada = null;
          });
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao criar barbearia: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Formulário',
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 101, 95),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Nome da Barbearia:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _nomeLojaController,
                decoration: InputDecoration(
                  hintText: 'Digite o nome da loja:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome da loja';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Seu Nome Completo:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _nomeCompletoController,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome completo:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu nome completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'CPF:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite seu CPF:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu CPF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'CNPJ:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _cnpjController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite o CNPJ:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o CNPJ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Localização:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _localizacaoController,
                decoration: InputDecoration(
                  hintText: 'Digite a localização:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite a localização';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Sobre a Barbearia:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _sobreController,
                decoration: InputDecoration(
                  hintText: 'Digite informações sobre a barbearia:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, forneça informações sobre a barbearia';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Número da Barbearia:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextFormField(
                controller: _numeroController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite o número da barbearia:',
                  hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o número da barbearia';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Tipo de Serviço:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              DropdownButtonFormField<String>(
                value: _servicoSelecionado,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                dropdownColor: const Color.fromARGB(255, 41, 44, 51),
                style: const TextStyle(color: Colors.white),
                items: _tiposServico.map((servico) {
                  return DropdownMenuItem(
                    value: servico,
                    child: Text(servico, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _servicoSelecionado = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um tipo de serviço';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              const Text(
                'Imagem de Destaque:',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              DropdownButtonFormField<String>(
                value: _imagemSelecionada,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(26, 27, 31, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(38, 39, 43, 1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                dropdownColor: const Color.fromARGB(255, 41, 44, 51),
                style: const TextStyle(color: Colors.white),
                items: _imagens.map((imagem) {
                  return DropdownMenuItem(
                    value: imagem['url'],
                    child: Text(imagem['titulo']!, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _imagemSelecionada = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione uma imagem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              if (_imagemSelecionada != null)
                Image.network(_imagemSelecionada!, height: 150),

              const SizedBox(height: 30),

              const RegisterLocation(),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Cadastro cancelado!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancelar', style: TextStyle(fontSize: 18)),
                  ),
                  ElevatedButton(
                    onPressed: _enviarFormulario,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color.fromRGBO(99, 47, 47, 1),
                    ),
                    child: const Text('Confirmar', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeLojaController.dispose();
    _nomeCompletoController.dispose();
    _cpfController.dispose();
    _cnpjController.dispose();
    _localizacaoController.dispose();
    _sobreController.dispose();
    _numeroController.dispose();
    super.dispose();
  }
}