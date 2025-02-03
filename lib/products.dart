/ products.dart
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Products', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildProductItem(context, 'Beef Burger', 'assets/burger.png', 20),
          _buildProductItem(context, 'Noodles', 'assets/noodles.png', 9),
        ],
      ),
    );
  }
  Widget _buildProductItem(BuildContext context, String name, String imagePath, int price) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('\$$price/', style: TextStyle(color: Colors.orange)),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductsScreen()),
            );
             },
        ),
      ),
    );
  }
}


