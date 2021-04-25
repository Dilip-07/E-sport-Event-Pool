import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Userprofile extends StatefulWidget {
  @override
  _UserprofileState createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.white,
          title: Text(
            'profile'.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff333951)),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
          children: [
            Text(
              "General Setting",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff333951),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text('contact us'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.mail, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('about us'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.info, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
            ),
          ],
        ));
  }
}
