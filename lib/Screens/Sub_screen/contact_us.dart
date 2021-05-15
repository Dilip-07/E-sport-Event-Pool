import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color(0xFF0C9869);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Feather.chevron_left),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Contact Us",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("For contactiing us"),
                Text("For contactiing us"),
                Text("For contactiing us"),
                Text("For contactiing us"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
