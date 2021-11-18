import 'package:flutter/material.dart';
import 'package:notif/Auth/login_page.dart';
import 'package:notif/Views/grup.dart';
import 'package:notif/Views/home.dart';
import 'package:notif/Views/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notif/Navigator/side_menu.dart';
import 'package:notif/main.dart';

/// This is the stateful widget that the main application instantiates.
class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Navbar> {
  bool _isSigningOut = false;
  bool _theme = false;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Grup(),
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
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[100],
        centerTitle: true,
        title: Text('Vald00s', style: TextStyle(color: Colors.black)),
      ),

      drawer: Sidemenu(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[100],
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Teman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Group',
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
