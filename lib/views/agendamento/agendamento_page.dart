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
            SizedBox(height: 0),
            SectionTitle(
              title: "CONFIRMADOS",
              fontSize: 12.0,
              color: Color.fromARGB(205, 255, 255, 255),
            ),
            
            SizedBox(height: 0),
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
    this.fontSize = 16.0,
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
                          "https://static.wixstatic.com/media/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg/v1/fill/w_640,h_516,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/7e2813_32470f410c2c4f9d910b8db25600b895~mv2.jpeg",
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
