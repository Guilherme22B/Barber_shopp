import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../widgets/main_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const BarberHomePage(),
    );
  }
}

class BarberHomePage extends StatelessWidget {
  const BarberHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Olá, Seja Bem-Vindo!",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sexta, 2 de Fevereiro",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            SearchBar(),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceButton(label: "Cabelo", icon: Icons.content_cut),
                  ServiceButton(label: "Barba", icon: MdiIcons.mustache),
                  ServiceButton(label: "Acabamento", icon: Icons.brush),
                ],
              ),
            ),
            SizedBox(height: 20),
            PromotionBanner(),
            SizedBox(height: 20),
            SectionTitle(title: "Recomendados"),
            SizedBox(height: 10),
            BarberList(),
            SizedBox(height: 20),
            SectionTitle(title: "Populares"),
            SizedBox(height: 10),
            BarberList(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Buscar",
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF1A1B1F),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF26272B),
            width: 2,
          ),
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ServiceButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(label,
          style: const TextStyle(
            color: Colors.white,
          )),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A1B1F),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.cut, size: 50),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Agende nos melhores com FSW Barber",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class BarberList extends StatelessWidget {
  const BarberList({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BarberCard(
          barberName: "Vintage Barber",
          address: "Avenida São Sebastião, 357, São Paulo",
        ),
        BarberCard(
          barberName: "Clássica Cortez",
          address: "Rua Castro Alves, 331, São Paulo",
        ),
      ],
    );
  }
}

class BarberCard extends StatelessWidget {
  final String barberName;
  final String address;

  const BarberCard(
      {super.key, required this.barberName, required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        title: Text(
          barberName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Reservar"),
        ),
      ),
    );
  }
}
