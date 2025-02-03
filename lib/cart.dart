// cart.dart
import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Cart', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCartItem('Noodles', 'assets/noodles.png', 9),
            _buildCartItem('Beef Burger', 'assets/burger.png', 20),
            SizedBox(height: 20),
