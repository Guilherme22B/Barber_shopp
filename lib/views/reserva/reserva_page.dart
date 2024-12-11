import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reserva de Corte de Cabelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DateTime? selectedDate; // Data começa como nula
  String selectedBarberShop = '';
  String selectedTime = ''; // Variável para armazenar o horário selecionado
  String selectedBarberShopAddress = ''; // Variável para armazenar o endereço da barbearia
  CalendarFormat calendarFormat = CalendarFormat.month;

  List<String> barberShops = [
    'Vintage Barber',
    'Los Barberos',
    'Classica Cortez',
    'Homem Elegante',
  ];

  Map<String, String> barberShopAddresses = {
    'Vintage Barber': 'Avenida São Sebastião, 357, São Paulo',
    'Los Barberos': 'Rua Sete de Setembro, 428, São Paulo',
    'Classica Cortez': 'Rua Castro Alves, 331, São Paulo',
    'Homem Elegante': 'Rua Projetada, 529, São Paulo',
  };

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  void _showValidationMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer Reserva'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seção para escolher a barbearia
                  Text(
                    'Selecione a Barbearia',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: selectedBarberShop.isEmpty ? null : selectedBarberShop,
                      isExpanded: true,
                      hint: Text('Escolha a Barbearia'),
                      items: barberShops.map((String shop) {
                        return DropdownMenuItem<String>(
                          value: shop,
                          child: Center(
                            child: Text(shop),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBarberShop = newValue!;
                          selectedBarberShopAddress = barberShopAddresses[selectedBarberShop]!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // Seção para escolher a data com calendário
                  Text(
                    'Escolha a Data',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TableCalendar(
                    focusedDay: selectedDate ?? DateTime.now(), // Valor inicial como data atual
                    firstDay: DateTime.utc(2023, 01, 01),
                    lastDay: DateTime.utc(2025, 12, 31),
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        if (selectedDay.isBefore(DateTime.now())) {
                          _showValidationMessage('Você não pode selecionar uma data passada!');
                        } else {
                          selectedDate = selectedDay;
                        }
                      });
                    },
                    calendarFormat: calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        calendarFormat = format;
                      });
                    },
                  ),
                  SizedBox(height: 20),

                  // Seção para escolher o horário
                  Text(
                    'Escolha o Horário',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (var time in ['09:00', '10:30', '11:15', '13:00', '14:30', '16:00','17:30','19:00'])
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                          child: Text(time, style: TextStyle(color: selectedTime == time ? Colors.white : Colors.blue)),
                          style: OutlinedButton.styleFrom(backgroundColor: selectedTime == time ? Colors.blue : null),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Resumo da reserva
                  Text(
                    'Resumo da Reserva',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Barbearia: $selectedBarberShop'),
                          Text('Endereço: $selectedBarberShopAddress'),
                          Text('Data: ${selectedDate != null ? formatDate(selectedDate!) : ''}'),
                          Text('Horário: $selectedTime'),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedBarberShop.isEmpty) {
                                _showValidationMessage('Por favor, selecione a barbearia!');
                              } else if (selectedTime.isEmpty) {
                                _showValidationMessage('Por favor, selecione um horário!');
                              } else if (selectedDate == null) {
                                _showValidationMessage('Por favor, selecione uma data!');
                              } else if (selectedDate!.isBefore(DateTime.now())) {
                                _showValidationMessage('A data selecionada não pode ser anterior à data atual!');
                              } else {
                                // Exibe um diálogo de confirmação
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Confirmar Reserva'),
                                      content: Text(
                                        'Barbearia: $selectedBarberShop\n'
                                        'Endereço: $selectedBarberShopAddress\n'
                                        'Data: ${formatDate(selectedDate!)}\n'
                                        'Horário: $selectedTime'
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('Voltar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => AvaliacaoPage()),
                                            );
                                          },
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text('Confirmar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Tela de avaliação
class AvaliacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliação'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Avalie sua experiência!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Redireciona de volta à home
                );
              },
              child: Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
