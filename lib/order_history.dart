import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'database_helper.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    final db = await DatabaseHelper.instance.database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_name TEXT,
        price REAL,
        quantity INTEGER
      )
    '''
    );
    _loadOrderHistory();
  }

  void _loadOrderHistory() async {
    final db = await DatabaseHelper.instance.database;
    final orderList = await db.query('orders');
    setState(() {
      orders = orderList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: orders.isEmpty
          ? Center(child: Text('No orders found', style: GoogleFonts.poppins(fontSize: 18)))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(orders[index]['item_name'], style: GoogleFonts.poppins(fontSize: 18)),
                    subtitle: Text('Price: \$${orders[index]['price']}', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey)),
                    trailing: Text('Qty: ${orders[index]['quantity']}', style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
                  ),
                );
              },
            ),
    );
  }
}
