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
            ElevatedButton(
              onPressed: () {},
              child: Text('Proceed to Checkout', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildCartItem(String name, String imagePath, int price) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('\$$price/', style: TextStyle(color: Colors.orange)),
        trailing: Icon(Icons.remove_circle, color: Colors.red),
      ),
    );
  }
}
