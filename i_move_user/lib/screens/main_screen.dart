import 'package:flutter/material.dart'; 

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  static const String screenID = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
    );
  }
}
