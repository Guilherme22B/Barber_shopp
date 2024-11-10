import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BarberShopPage(),
    );
  }
}

class BarberShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho com imagem e ícones sobrepostos
          Stack(
            children: [
              // Imagem de fundo
              Image.asset(
                'assets/images/cabecalho.jpeg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              // Barra de status (para garantir que os ícones não fiquem muito no topo)
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.black.withOpacity(0.3),
              ),
              // Ícones sobrepostos
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PulsingIconButton(
                        icon: Icons.arrow_back,
                        onPressed: () {},
                      ),

                      // Button menu
                      PulsingIconButton(
                        icon: Icons.menu,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              // Gradiente para melhorar a visibilidade dos ícones
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Conteúdo da página
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vintage Barber',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 4.0),
                        Text('Avenida São Sebastião, 357, São Paulo'),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4.0),
                        Text('5.0 (889 avaliações)'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    const Text(
                      'SOBRE NÓS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    const Text(
                      'Bem-vindo à Vintage Barber, onde tradição encontra estilo. Nossa equipe de mestres barbeiros transforma cortes de cabelo e barbas em obras de arte. Em um ambiente acolhedor, promovemos confiança, estilo e uma comunidade unida.',
                    ),
                    SizedBox(height: 16.0),
                    const Text(
                      'SERVIÇOS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ServiceCard(
                      imageUrl:
                          'assets/images/cabecalho.jpeg', // Replace with actual image URL
                      serviceName: 'Corte de Cabelo',
                      serviceDescription:
                          'Estilo personalizado com as últimas tendências.',
                      price: 'R\$ 50,00',
                    ),
                    ServiceCard(
                      imageUrl: 'assets/images/cabecalho.jpeg',
                      serviceName: 'Barba',
                      serviceDescription:
                          'Modelagem completa para destacar sua masculinidade.',
                      price: 'R\$ 45,00',
                    ),
                    SizedBox(height: 16.0),
                    const Text(
                      'CONTATO',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ContactCard(
                      phoneNumber: '(11) 98204-5108',
                    ),
                    ContactCard(
                      phoneNumber: '(11) 99503-2351',
                    ),
                    SizedBox(height: 16.0),
                    const Center(
                      child: Text(
                        ' 2023 Copyright FSW Barber',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ); // Correção aplicada aqui
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String serviceName;
  final String serviceDescription;
  final String price;

  ServiceCard({
    required this.imageUrl,
    required this.serviceName,
    required this.serviceDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Text('Erro ao carregar imagem');
              },
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(serviceDescription),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Reservar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String phoneNumber;

  ContactCard({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.phone),
        title: Text(phoneNumber),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), // Padding para fazer o botão mais quadrado
            side: BorderSide(color: Colors.white, width: 1), // Borda branca
            shape: RoundedRectangleBorder(
              // Faz o botão quadrado
              borderRadius:
                  BorderRadius.circular(10), // BorderRadius 0 para cantos retos
            ),
          ),
          child: Text(
            'Copiar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// botoes superiores
class PulsingIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  PulsingIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  _PulsingIconButtonState createState() => _PulsingIconButtonState();
}

class _PulsingIconButtonState extends State<PulsingIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed && _isHovered) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.stop();
          _animationController.value = 1.0;
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: _isHovered ? 10 : 0,
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(widget.icon, color: Colors.white),
                onPressed: widget.onPressed,
              ),
            ),
          );
        },
      ),
    );
  }
}
