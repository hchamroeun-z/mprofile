import 'package:flutter/material.dart';
import 'package:mprofile/basic_module/foodscreen.dart';
import 'package:mprofile/basic_module/myhome.dart';
import 'package:mprofile/basic_module/settingscreen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar());
  }

  Widget _buildBody(){
    return IndexedStack(
      index: _currentIndex,
      children: [
        Foodscreen(),
        MyHomePage(),
        SettingsScreen(),
        Container(color: Colors.purple),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      type: .fixed,
      selectedItemColor: Colors.red,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }
}
