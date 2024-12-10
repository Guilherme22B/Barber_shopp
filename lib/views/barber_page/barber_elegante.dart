import 'package:flutter/material.dart';
import 'package:myapp/views/book/book_page.dart';
import '../../widgets/main_layout.dart';

class BarberElegantePage extends StatelessWidget {
  const BarberElegantePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          // Cabeçalho com imagem e ícones sobrepostos
          Stack(
            children: [
              // Imagem de fundo
              Image.network(
                "data:image/jpeg;base64,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",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.black.withOpacity(0.3),
              ),

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
          
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Homem Elegante',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 4.0),
                        Text('Rua Projetada, 529, São Paulo'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4.0),
                        Text('5.0 (1.032 avaliações)'),
                      ],
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'SOBRE NÓS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Bem-vindo à Homem Elegante, onde tradição encontra estilo. Nossa equipe de mestres barbeiros transforma cortes de cabelo e barbas em obras de arte. Em um ambiente acolhedor, promovemos confiança, estilo e uma comunidade unida.',
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'SERVIÇOS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 10.0),
                    const ServiceCard(
                      imageUrl:
                          "data:image/jpeg;base64,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",
                      serviceName: 'Corte de Cabelo',
                      serviceDescription:
                          'Estilo personalizado com as últimas tendências.',
                      price: 'R\$ 50,00',
                    ),
                    const ServiceCard(
                      imageUrl: 
                      "data:image/jpeg;base64,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",
                      serviceName: 'Barba',
                      serviceDescription:
                          'Modelagem completa para destacar sua masculinidade.',
                      price: 'R\$ 45,00',
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'CONTATO',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ContactCard(
                      phoneNumber: '(11) 98204-5108',
                    ),
                    ContactCard(
                      phoneNumber: '(11) 99503-2351',
                    ),
                    const SizedBox(height: 16.0),
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

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.serviceName,
    required this.serviceDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(serviceDescription),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton( onPressed: () { 
                        Navigator.push( context, 
                         MaterialPageRoute( builder: (context) => ReservaScreen(), 
                      ), 
                    ); 
                  }, 
                      child: const Text("Reservar"), 
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

  const ContactCard({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.phone),
        title: Text(phoneNumber),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), 
            side:
                const BorderSide(color: Colors.white, width: 1), // Borda branca
            shape: RoundedRectangleBorder(
              // Faz o botão quadrado
              borderRadius:
                  BorderRadius.circular(10), // BorderRadius 0 para cantos retos
            ),
          ),
          child: const Text(
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

  const PulsingIconButton({
    super.key,
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
      duration: const Duration(milliseconds: 600),
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