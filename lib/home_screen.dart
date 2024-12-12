import 'package:flutter/material.dart';

class Sweet {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Sweet({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({required this.username});

  final List<Sweet> sweets = [
    Sweet(
      name: 'Gomitas',
      description: 'Deliciosas gomitas de frutas.',
      price: 1.50,
      imageUrl: 'https://example.com/gomitas.jpg', // Reemplaza con una URL válida
    ),
    Sweet(
      name: 'Chocolate',
      description: 'Chocolate negro con almendras.',
      price: 2.00,
      imageUrl: 'https://example.com/chocolate.jpg', // Reemplaza con una URL válida
    ),
    Sweet(
      name: 'Caramelos',
      description: 'Caramelos de menta refrescante.',
      price: 0.75,
      imageUrl: 'https://example.com/caramelos.jpg', // Reemplaza con una URL válida
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido, $username'),
        backgroundColor: Color(0xFF376C5C),
      ),
      body: Container(
        color: Color(0xFFB2E2B2), // Fondo verde pastel
        child: ListView.builder(
          itemCount: sweets.length,
          itemBuilder: (context, index) {
            final sweet = sweets[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      sweet.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(sweet.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(sweet.description),
                          Text('\$${sweet.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Simular el pedido
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Has pedido ${sweet.name}!'),
                        ));
                      },
                      child: Text('Pedido'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF376C5C),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Tarjetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Color(0xFFFFC1CC),
        unselectedItemColor: Color(0xFF376C5C),
      ),
    );
  }
}
