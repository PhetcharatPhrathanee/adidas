import 'package:flutter/material.dart';
import 'adidas_screen.dart';
import 'search_screen.dart';
import 'favorite_screen.dart';
import 'shop_screen.dart';
import 'adiclub_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final Map<int, Map<String, Widget>> _navigationMap = {
    0: {"title": const Text("SHOP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), "screen": AdidasScreen()},
    1: {"title": const Text("SEARCH", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), "screen": SearchScreen()},
    2: {"title": const Text("FAVORITES", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), "screen": FavoriteScreen()},
    3: {"title": const Text("SHOP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), "screen": ShopScreen()},
    4: {"title": const Text("ADICLUB", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), "screen": AdiclubScreen()},
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_selectedIndex == 0 ? 120.0 : 60.0), // ✅ ขยายเฉพาะหน้า SHOP
        child: AppBar(
          title: _navigationMap[_selectedIndex]!['title'],
          actions: [
            IconButton(
              icon: Icon(Icons.person_outline, color: Colors.black),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white, // ✅ ทำให้พื้นหลังเป็นสีขาว
          elevation: 0, // ปิดเงา AppBar
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ✅ เส้นขอบใต้ AppBar
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300], // สีของขอบ AppBar
              ),

              // ✅ ช่องค้นหาพร้อมขอบ (แสดงเฉพาะหน้า SHOP)
              if (_selectedIndex == 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8), // ขอบมน
                      border: Border.all(color: Colors.grey[400]!, width: 1), // ✅ ขอบของช่องค้นหา
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none, // ลบเส้นขอบเริ่มต้นของ TextField
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),

      body: _navigationMap[_selectedIndex]!['screen'],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 24,
                height: 28,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Center(child: Icon(Icons.search)), label: ''),
          BottomNavigationBarItem(icon: Center(child: Icon(Icons.favorite_border)), label: ''),
          BottomNavigationBarItem(icon: Center(child: Icon(Icons.shopping_bag_outlined)), label: ''),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/adiclub.png',
                width: 32,
                height: 32,
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}