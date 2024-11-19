import 'package:flutter/material.dart';
import '../../widgets/main_layout.dart';

class CategoriaPage extends StatelessWidget {
  const CategoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWithButton(),
              SizedBox(height: 15),
              Text(
                "RESULTADOS PARA 'BARBA'",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(165, 255, 255, 255),
                ),
              ),
              SizedBox(height: 15),
              SalonGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarWithButton extends StatelessWidget {
  const SearchBarWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Buscar",
              hintStyle: const TextStyle(
                color: Color.fromARGB(170, 255, 255, 255),
                fontSize: 14,
              ),
              filled: true,
              fillColor: const Color(0xFF1A1B1F),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF26272B),
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 81, 40, 34),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class SalonGrid extends StatelessWidget {
  const SalonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de salões
    final List<Map<String, dynamic>> salons = [
      {
        "rating": 5.0,
        "name": "Vintage Barber",
        "location": "Avenida São Sebastião 357, São Paulo",
        "imageUrl": "https://static.wixstatic.com/media/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg/v1/fill/w_640,h_516,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg",
      },
      {
        "rating": 5.0,
        "name": "Clássica Cortez",
        "location": "Rua Castro Alves 331, São Paulo",
        "imageUrl": "https://images.unsplash.com/photo-1517832606299-7ae9b720a186?auto=format&fit=crop&w=1920",
      },
      {
        "rating": 5.0,
        "name": "Los Barberos",
        "location": "Rua Sete de Setembro 428, São Paulo",
        "imageUrl": "https://clubedobarba.com.br/wp-content/uploads/2023/08/cabeleireiro.jpg",
      },
      {
        "rating": 5.0,
        "name": "Homem Elegante",
        "location": "Rua Projetada 529, São Paulo",
        "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb-mhX0FTkRikMhIjhzGcYEIM15zari3Cpfi1GFo6uwwy_2uox",
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 5,
      childAspectRatio: 0.57,
      children: salons.map((salon) {
        return SalonCard(
          rating: salon['rating'],
          name: salon['name'],
          location: salon['location'],
          imageUrl: salon['imageUrl'],
        );
      }).toList(),
    );
  }
}

class SalonCard extends StatelessWidget {
  final double rating;
  final String name;
  final String location;
  final String imageUrl;

  const SalonCard({
    super.key,
    required this.rating,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1B1F),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 7,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(210, 81, 40, 34),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding:const  EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(200, 181, 127, 27),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color.fromARGB(165, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(91, 54, 56, 65),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  ),
                  child: const Text(
                    "Reservar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
