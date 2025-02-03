import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  CartPage({required this.items});

  double getTotalPrice() {
    double total = 0;
    for (var item in items) {
      total += (item['price'] * item['quantity']);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2 Items in cart',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset('images/${item['name'].toLowerCase().replaceAll(" ", "_")}.png', height: 50),
                      title: Text(item['name'], style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text('\$${item['price']}/', style: TextStyle(color: Colors.orange)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: Icon(Icons.remove_circle), onPressed: () {}),
                          Text('${item['quantity']}'),
                          IconButton(icon: Icon(Icons.add_circle, color: Colors.green), onPressed: () {}),
                          IconButton(icon: Icon(Icons.cancel, color: Colors.red), onPressed: () {}),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Center(
                child: Text('Proceed to Checkout',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('< Back To Menu',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
