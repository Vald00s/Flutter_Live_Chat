import 'package:flutter/material.dart';
import 'package:notif/Auth/login_page.dart';
import 'package:notif/Auth/profile_page.dart';
import 'package:notif/Views/chat.dart';
import 'package:notif/Views/home.dart';
import 'package:notif/Views/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

/// This is the stateful widget that the main application instantiates.
class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Chat(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        title: Text(
          'Vald00s',
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.amber[800], size: 30),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      //
      //
    );
  }
}
