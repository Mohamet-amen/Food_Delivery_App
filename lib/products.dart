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

