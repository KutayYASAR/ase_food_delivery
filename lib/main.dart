import 'package:flutter/material.dart';
import 'package:food_delivery/home_page.dart';
import 'package:food_delivery/order_page.dart';
import 'package:food_delivery/restaurant_page.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: _pageSelector()
    );
  }

}
class _pageSelector extends StatefulWidget {
  _pageSelector({Key? key}) : super(key: key);

  @override
  __pageSelectorState createState() => __pageSelectorState();
}

class __pageSelectorState extends State<_pageSelector> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions  = <Widget>[
    HomePage(),
    HomePage(),
    OrderPage(),
  ];
   static List<AppBar> _appbarOptions  = <AppBar>[
    appBarHomePage(),
    appBarHomePage(),
    appBarOrder(),

  ];
  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarOptions.elementAt(_selectedIndex),
      body: 
        _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Anasayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Sepetim'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: 'Siparişlerim'),
      ],
      unselectedItemColor: Colors.grey[700],
      selectedItemColor: Colors.amber[800],
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      ),
      );
  }
}