import 'package:flutter/material.dart';
import 'package:myapp/views/home/home_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const BookPageApp());
}

class BookPageApp extends StatelessWidget {
  const BookPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BookPage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
    );
  }
}

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String selectedTime = "09:45";
  double price = 50.0;
  String barbershopName = "Vintage Barber";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Reserva'),
        backgroundColor: Colors.black,
        actions: <Widget>[ 
          IconButton( icon: const Icon(Icons.close), 
          onPressed: () { 
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()));
          }, 
        ),
      ], 
    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Calendário personalizado
            SizedBox(
              height: 350,
              child: TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Horário',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                timeButton("09:00"),
                timeButton("09:45"),
                timeButton("10:30"),
                timeButton("11:15"),
              ],
            ),
            const SizedBox(height: 20),
            buildPriceInfo(),
            const SizedBox(height: 20),
            buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget timeButton(String time) {
    bool isSelected = time == selectedTime;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTime = time;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.brown : Colors.grey[700],
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(
        time,
        style: TextStyle(color: isSelected ? Colors.white : Colors.white70),
      ),
    );
  }

  Widget buildPriceInfo() {
    return Card(
      elevation: 2,
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Corte de Cabelo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              'R\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 5),
            Text(
              'Data: ${_selectedDay != null ? DateFormat('dd/MM/yyyy').format(_selectedDay!) : 'Selecione uma data'}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            Text(
              'Horário: $selectedTime',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            Text(
              'Barbearia: $barbershopName',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_selectedDay == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Por favor, selecione uma data.')),
            );
            return;
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmar Reserva'),
                content: Text(
                  'Deseja confirmar a reserva para $barbershopName no dia ${DateFormat('dd/MM/yyyy').format(_selectedDay!)} às $selectedTime?',
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reserva confirmada!')),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Confirmar'),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        child: const Text('Confirmar'),
      ),
    );
  }
}


