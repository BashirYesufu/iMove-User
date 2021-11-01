import 'package:flutter/material.dart';
import 'package:i_move_user/screens/login_screen.dart';
import 'package:i_move_user/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iMove',
      theme: ThemeData(
        fontFamily: 'Bolt-Regular',
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}