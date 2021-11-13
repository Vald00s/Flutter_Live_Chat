import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Text(
              'Screen 1',
              style: TextStyle(color: Colors.yellow, fontSize: 20),
            ),
            margin: EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}
