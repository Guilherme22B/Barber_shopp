import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Importar FirebaseAuth para acesso ao UID

class BookPage extends StatefulWidget {
  final String barbershopName;
  final String? barbershopImageUrl;

  const BookPage({
    super.key,
    required this.barbershopName,
    this.barbershopImageUrl,
  });

  @override
  BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String selectedTime = "09:45";
  double price = 50.0;

  Future<void> _sendBookingData() async {
    if (_selectedDay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma data.')),
      );
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário não autenticado.')),
      );
      return;
    }

    final bookingData = {
      'barbershopName': widget.barbershopName,
      'imageUrl': widget.barbershopImageUrl,
      'date': DateFormat('dd/MM/yyyy').format(_selectedDay!),
      'time': selectedTime,
      'status': 'pendente', // Inicialmente como "pendente"
    };

    try {
      // Adiciona a nova reserva no documento do usuário
      DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

      await userDoc.update({
        'reservas': FieldValue.arrayUnion([bookingData]) // Adiciona a reserva no array 'reservas'
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reserva confirmada!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Reserva'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
              'Barbearia: ${widget.barbershopName}',
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
        onPressed: _sendBookingData,
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