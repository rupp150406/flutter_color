import 'package:flutter/material.dart';
import 'package:tiket_wisata/constants/color.dart';
import 'package:tiket_wisata/pages/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _buildHomePage(), // Home tetap dalam satu file tanpa dipisah
      OrderPage(),
      Center(child: Text('Profile Page')), // Halaman Profile (placeholder)
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          Text(
            'Find Your Dream Destination',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Search your Destination',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.ternary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
