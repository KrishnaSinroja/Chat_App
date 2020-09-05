import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/singup_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Chat App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Signup()
    );
  }
}

