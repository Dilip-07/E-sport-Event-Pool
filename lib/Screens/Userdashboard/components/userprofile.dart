import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:user/Screens/Loginpage/Login_page.dart';
import 'package:user/Screens/Sub_screen/Edit_profile.dart';

class Userprofile extends StatefulWidget {
  @override
  _UserprofileState createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            ListTile(
                title: Text('edit profile'),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Feather.edit_3, size: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Feather.chevron_right,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      // ignore: missing_required_param
                      MaterialPageRoute(builder: (context) => Editprofile()));
                }),
            Divider(
              height: 5,
            ),
            ListTile(
                title: Text("Log Out"),
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(Feather.log_out, size: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Feather.chevron_right,
                  size: 20,
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LogInPage()));
                  });
                }),
            SizedBox(
              height: 25,
            ),
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
            ListTile(
              title: Text('privacy policy'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.lock, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}
