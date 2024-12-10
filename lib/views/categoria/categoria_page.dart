import 'package:flutter/material.dart';
import 'package:myapp/views/book/book_page.dart';
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

class CabeloPage extends StatelessWidget {
  const CabeloPage({super.key});

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
                "RESULTADOS PARA 'CABELO'",
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

class AcabamentoPage extends StatelessWidget {
  const AcabamentoPage({super.key});

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
                "RESULTADOS PARA 'ACABAMENTO'",
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
        "imageUrl":
            "https://static.wixstatic.com/media/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg/v1/fill/w_640,h_516,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg",
      },
      {
        "rating": 5.0,
        "name": "Clássica Cortez",
        "location": "Rua Castro Alves 331, São Paulo",
        "imageUrl":
            "https://images.unsplash.com/photo-1517832606299-7ae9b720a186?auto=format&fit=crop&w=1920",
      },
      {
        "rating": 5.0,
        "name": "Los Barberos",
        "location": "Rua Sete de Setembro 428, São Paulo",
        "imageUrl":
            "data:image/jpeg;base64,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",
      },
      {
        "rating": 5.0,
        "name": "Homem Elegante",
        "location": "Rua Projetada 529, São Paulo",
        "imageUrl":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb-mhX0FTkRikMhIjhzGcYEIM15zari3Cpfi1GFo6uwwy_2uox",
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReservaScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(91, 54, 56, 65),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
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
