import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/views/book/book_page.dart';
import '../../widgets/main_layout.dart';

class BarberDetailPage extends StatelessWidget {
  final String barberName;
  final String address;
  final String? description;
  final String? imageUrl;
  final String? serviceType;
  final double? rating;
  final String? phoneNumber;

  const BarberDetailPage({
    super.key,
    required this.barberName,
    required this.address,
    this.description,
    this.imageUrl,
    this.serviceType,
    this.rating,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          Stack(
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey,
                      child: const Center(child: Text('Imagem não disponível')),
                    );
                  },
                )
              else
                Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text('Imagem não disponível')),
                ),
              Container(
                height: 200,
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
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barberName,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 4.0),
                        Text(address, style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < (rating ?? 0) ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(color: Colors.white54),
                    const Text(
                      'SOBRE NÓS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description ?? 'Informações sobre a barbearia não disponíveis.',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(color: Colors.white54),
                    const Text(
                      'SERVIÇOS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    if (serviceType == 'Ambos' || serviceType == 'Cabelo')
                      ServiceCard(
                        barberName: barberName,
                        imageUrl: "https://via.placeholder.com/100",
                        serviceName: 'Corte de Cabelo',
                        serviceDescription: 'Estilo personalizado com as últimas tendências.',
                        price: 'R\$ 50,00',
                      ),
                    if (serviceType == 'Ambos' || serviceType == 'Barba')
                      ServiceCard(
                        barberName: barberName,
                        imageUrl: "https://via.placeholder.com/100",
                        serviceName: 'Barba',
                        serviceDescription: 'Modelagem completa para destacar sua masculinidade.',
                        price: 'R\$ 45,00',
                      ),
                    const SizedBox(height: 16.0),
                    const Divider(color: Colors.white54),
                    const Text(
                      'CONTATO',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ContactCard(
                      phoneNumber: phoneNumber ?? 'Telefone não disponível',
                    ),
                    const SizedBox(height: 16.0),
                    const Center(
                      child: Text(
                        '2023 Copyright FSW Barber',
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
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String serviceName;
  final String serviceDescription;
  final String price;
  final String barberName;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.serviceName,
    required this.serviceDescription,
    required this.price,
    required this.barberName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1B1F), // Ajuste de cor para o layout
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: const Center(child: Text('Imagem não disponível')),
                );
              },
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
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(serviceDescription, style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A1B1F),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookPage(
                                barbershopName: barberName,
                                barbershopImageUrl: imageUrl,
                              ),
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
      color: const Color(0xFF1A1B1F), // Ajuste de cor para o layout
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.phone, color: Colors.white),
        title: Text(phoneNumber, style: const TextStyle(color: Colors.white)),
        trailing: ElevatedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: phoneNumber));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF26272B),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            side: const BorderSide(color: Colors.white, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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