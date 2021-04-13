import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              foregroundImage: AssetImage('assets/avatar.jpg'),
              backgroundColor: Colors.red,
            ),
            Text(
              'Bemmy Vildosemmy',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Flutter Developer'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[100],
                fontFamily: 'Source Sans',
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 20,
              width: 140,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+44 123 456 789',
                  style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'Source Sans',
                      fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.teal,
                ),
                title: Text(
                  'me@bemmy.page',
                  style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'Source Sans',
                      fontSize: 20),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
