import 'package:flutter/material.dart';

class ReservaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 21, 24, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão de Fechar
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            // Título da página
            const Text(
              'Detalhes da Reserva',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'bold',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),

            // Imagem do Mapa
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    Colors.grey[800], // Cor de fundo enquanto a imagem carrega
              ),
              child: Stack(
                children: [
                  // Imagem do mapa (substituir pelo seu asset)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'assets/images/mapaBarber.png', // Substitua pelo caminho da sua imagem
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  // Detalhes da Barbearia sobrepostos
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              'assets/images/cabecalho.jpeg',
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vintage Barber',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'bold',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Avenida São Sebastião, 357, São Paulo',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'bold',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Detalhes da Reserva

            // Status
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(26, 27, 31, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Confirmado',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily:
                      'bold', // Pode ser uma fonte diferente para esse texto específico
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Color.fromRGBO(26, 27, 31, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Serviço e Preço
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Corte de Cabelo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'R\$50,00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Informações da Reserva
                    _buildInfoRow('Data', '22 de Julho'),
                    SizedBox(height: 8),
                    _buildInfoRow('Horário', '09:45'),
                    SizedBox(height: 8),
                    _buildInfoRow('Barbearia', 'Vintage Barber'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Continuar com as seções de detalhes e ações
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contatos
                    const Text(
                      'Contatos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildContactRow(context, '(11) 98204-5108'),
                    SizedBox(height: 10),
                    _buildContactRow(context, '(11) 99503-2351'),

                    Spacer(),

                    // Botões de Ação
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                          child: const Text(
                            'Voltar',
                            style: TextStyle(
                              fontFamily:
                                  'bold', // Pode ser uma fonte diferente para esse texto específico
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Reserva cancelada!')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                          child: const Text(
                            'Cancelar Reserva',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily:
                                  'bold', // Pode ser uma fonte diferente para esse texto específico
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para exibir informações de data, horário e barbearia
  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Widget para contatos
  Widget _buildContactRow(BuildContext context, String phone) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          phone,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$phone copiado!')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
          ),
          child: const Text(
            'Copiar',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'bold',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReservaScreen(),
  ));
}
