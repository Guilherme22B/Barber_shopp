import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalhes da Reserva',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ReservationDetailsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReservationDetailsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> appointments = [
    {
      'data': '06 de Setembro',
      'horario': '09:00',
      'servico': 'Corte de Cabelo',
      'barbearia': 'Vintage Barber',
      'status': 'Confirmado',
    },
    {
      'data': '07 de Agosto',
      'horario': '14:30',
      'servico': 'Corte de Cabelo',
      'barbearia': 'Classica Cortez',
      'status': 'Finalizado',
    },
    {
      'data': '20 de Julho',
      'horario': '17:30',
      'servico': 'Corte de Cabelo',
      'barbearia': 'Los Barberos',
      'status': 'Finalizado',
    },
    {
      'data': '23 de Junho',
      'horario': '19:00',
      'servico': 'Corte de Cabelo',
      'barbearia': 'Homem Elegante',
      'status': 'Finalizado',
    },
  ];

  List<Map<String, dynamic>> _getAppointmentsByStatus(String status) {
    return appointments
        .where((appointment) => appointment['status'] == status)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Reserva'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Detalhes da Reserva com imagem de fundo
            Stack(
              children: [
                // Imagem de fundo
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/eb7b/17ba/788a8ad1c8e07dc619bd02dc696a5ea4?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=okVplKi4eFdH1mRKzm5EfeqzXZUOZ9fbUJlmaOqbttl20m8saMmgC82x4xfYVvNxJyvEXxAAsbVBE6x9nJb7ZWZd4Mu86enn976SD~H6d9LLsilq8H~z562tPhHWETPf3kSOXnSGcXAWlbRlWbPRSwQeFoCPPDYbDcFGRRmizFAm9TMsZ8tTrApiVUpz~bW4feZgHoATiqYF0YjJT-bVot0fveQPE5xEutxIUQi3bGXZhcsCB6Ub9puEUrUVDKs~dvIlqiatGvtVxIuSRWlTGIAEFX3YRUHppquLDrGhXuz2YJYWz6rh4eN96kgipjle7JTheJayl75byvVftZOylA__',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Conteúdo com fundo escuro
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vintage Barber',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 198, 73, 73),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Endereço: Avenida São Sebastião, 357',
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contato 1: (11) 98204-5108',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                'Contato 2: (11) 99503-2351',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Contato copiado!'),
                                ),
                              );
                            },
                            child: Text('Copiar'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text('Cancelar Reserva'),
                                  content: Text(
                                      'Tem certeza que deseja cancelar a reserva?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context),
                                      child: Text('Não'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Reserva cancelada com sucesso!'),
                                          ),
                                        );
                                      },
                                      child: Text('Sim'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Reserva confirmada com sucesso!'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text('Confirmar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Lista de Agendamentos Confirmados
            Text(
              'Agendamentos Confirmados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _getAppointmentsByStatus('Confirmado').length,
              itemBuilder: (context, index) {
                final appointment =
                    _getAppointmentsByStatus('Confirmado')[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(appointment['servico']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data: ${appointment['data']}'),
                        Text('Horário: ${appointment['horario']}'),
                        Text('Barbearia: ${appointment['barbearia']}'),
                      ],
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Lista de Agendamentos Finalizados
            Text(
              'Agendamentos Finalizados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _getAppointmentsByStatus('Finalizado').length,
              itemBuilder: (context, index) {
                final appointment =
                    _getAppointmentsByStatus('Finalizado')[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(appointment['servico']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data: ${appointment['data']}'),
                        Text('Horário: ${appointment['horario']}'),
                        Text('Barbearia: ${appointment['barbearia']}'),
                      ],
                    ),
                    trailing: Icon(
                      Icons.done_all,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
            // Avaliação com estrelas
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => RatingDialog(),
                );
              },
              child: Text('Avaliar Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Avaliar Serviço'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Dê sua avaliação:'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => IconButton(
                icon: Icon(
                  selectedRating > index ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    selectedRating = index + 1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Fecha o diálogo
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Avaliação enviada com sucesso!'),
              ),
            );
            // Redireciona para a tela inicial
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ReservationDetailsScreen()),
            );
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }
}
