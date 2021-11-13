import 'package:flutter/material.dart';
import 'package:notif/Auth/login_page.dart';
import 'package:notif/Auth/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notif/Views/profile.dart';
import 'package:notif/Views/setting.dart';

class Sidemenu extends StatelessWidget {
  bool _isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Vald00s',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.none,
                    image: AssetImage('assets/images/1.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async => {
              await FirebaseAuth.instance.signOut(),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
