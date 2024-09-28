import 'package:flutter/material.dart';
import '../../widgets/main_layout.dart';

const Color confirmadoColor = Color.fromRGBO(162, 132, 94, 1); 
const Color finalizadoColor = Color.fromRGBO(131, 136, 150, 1); 

class AgendamentoPage extends StatelessWidget {
  const AgendamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "Agendamentos",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SectionTitle(
              title: "CONFIRMADOS",
              fontSize: 12.0,
              color: Color.fromARGB(205, 255, 255, 255),
            ),
            SizedBox(height: 10),
            BarberList(isFinalizado: false), // Lista de confirmados
            SizedBox(height: 20),
            SectionTitle(
              title: "FINALIZADOS",
              fontSize: 12.0,
              color: Color.fromARGB(205, 255, 255, 255),
            ),
            BarberList(isFinalizado: true), // Lista de finalizados
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const SectionTitle({
    super.key,
    required this.title,
    this.fontSize = 18.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class BarberList extends StatelessWidget {
  final bool isFinalizado;

  const BarberList({super.key, required this.isFinalizado});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: isFinalizado
          ? const [
              CortesCard(
                confirmadoName: "Finalizado",
                cortesName: "Corte de cabelo",
                barberName: "Vintage barber",
                date: "Julho\n   22",
              ),
              CortesCard(
                confirmadoName: "Finalizado",
                cortesName: "Corte de cabelo",
                barberName: "Vintage barber",
                date: "Julho\n   07",
              ),
              CortesCard(
                confirmadoName: "Finalizado",
                cortesName: "Corte de cabelo",
                barberName: "Vintage barber",
                date: "Junho\n   23",
              ),
            ]
          : const [
              CortesCard(
                confirmadoName: "Confirmado",
                cortesName: "Corte de cabelo",
                barberName: "Vintage barber",
                date: "Agosto\n    06",
              ),
            ],
    );
  }
}

class CortesCard extends StatelessWidget {
  final String confirmadoName;
  final String cortesName;
  final String barberName;
  final String date;

  const CortesCard({
    super.key,
    required this.confirmadoName,
    required this.cortesName,
    required this.barberName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    if (confirmadoName == "Confirmado") {
      backgroundColor = const Color.fromRGBO(35, 31, 38, 0.72);
    } else {
      backgroundColor = const Color.fromRGBO(25, 31, 38, 1);
    }

    return Card(
      color: const Color.fromRGBO(38, 39, 43, 1),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      confirmadoName,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: confirmadoName == "Confirmado" ? confirmadoColor : finalizadoColor,
                      ), 
                    ),
                  ),
                  const SizedBox(height: 5), 
                  Text(
                    cortesName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/2f7f/0250/6b545e7df7f46978c54489089e18d1db?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k6hUCf4E5~~VTxRvqrAqNNoykchjyeIEKVPJn0MyvA4oxkfXc04wHjtsT72x5EGQnANJka2MOpNiX1rjIMrJYqn95PeXXV6Emn6iG0E2W2PZJ-mBa1Y-5Ppr5hcGBi1SZkS3xIVKnMFcx6liwxxz7IN6LNuBMi5zzcR5INPVV0eR~aYcIJcTdFTm9Whq0vRyRkOEi3hh0a8xTK6K7M7zqssBA8a8v4CvcFPwyN0SrXsHX89KGFZ747Qr3uOZ56abA4heIap4CUQ~Xx41Zx6p4nlAfjbv8TrSXpAUvLQd79Cr-3suPN2~CErU~xzH9fxaFXzC2vStVJGH5mMxY6dOfA__",
                        ),
                        radius: 12, 
                      ),
                      const SizedBox(width: 6), 
                      Text(barberName),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 60,
              color: const Color.fromARGB(105, 255, 255, 255),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            Text(
              date,
              style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
