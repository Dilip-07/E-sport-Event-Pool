import 'package:flutter/material.dart';
import 'package:user/Screens/Userdashboard/components/sub_components/home_components/title.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}
