import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Cart_Page.dart';
import 'profile.dart';
import 'LoginPage.dart';
import 'menu.dart';
import 'order_history.dart';
class HomePage extends StatefulWidget {
  final String userEmail;
  const HomePage({Key? key, required this.userEmail}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(userEmail: widget.userEmail)));
    } else if (index == 1) {
      Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => CartPage(items: [])));

    } else if (index == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MenuPage(onAddToCart: (item) {})));
    } else if (index == 3) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
    } else if (index == 4) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProfilePage(loggedInEmail: widget.userEmail)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(loggedInEmail: widget.userEmail)));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('images/05.png'),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/05.png'),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(widget.userEmail,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.purple),
              title: Text('Home', style: GoogleFonts.poppins(fontSize: 18)),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.purple),
              title: Text('Cart', style: GoogleFonts.poppins(fontSize: 18)),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.purple),
              title: Text('Profile', style: GoogleFonts.poppins(fontSize: 18)),
              onTap: () => _onItemTapped(4),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: GoogleFonts.poppins(fontSize: 18)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Waarid - Feast The Essence',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your desired meal here...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.purple),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Promotions',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              promoBanner(),
              SizedBox(height: 20),
              Text(
                'Popular',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return popularItem('Item ${index + 1}',
                      '\$${(index + 1) * 10}', 'images/00.png');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget promoBanner() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todays Offer',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Free Box of Fries!',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'on all orders above \$150',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }

  Widget popularItem(String name, String price, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 80),
          SizedBox(height: 10),
          Text(name,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          Text(price,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.orange)),
          Icon(Icons.add_circle, color: Colors.green),
        ],
      ),
    );
  }
}
