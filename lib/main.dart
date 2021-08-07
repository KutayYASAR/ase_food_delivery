import 'package:flutter/material.dart';
import 'package:food_delivery/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Anasayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Sepetim'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: 'Siparişlerim'),
      ], unselectedItemColor: Colors.grey[700],
      selectedItemColor: Colors.amber[800],
      showUnselectedLabels: true,
      ),
      body: HomePage(),
      )
    );
  }
}