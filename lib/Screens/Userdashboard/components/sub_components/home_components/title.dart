import 'package:flutter/material.dart';
import 'package:user/Screens/Userdashboard/components/userprofile.dart';
import 'package:user/Utils/nextscreen.dart';

class Header extends StatelessWidget {
  @override
  const Header({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Esport Event Pool'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff333951),
                    ),
                  ),
                  Text(
                    'explore Everything',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff333951),
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 28),
                ),
                onTap: () {
                  nextScreen(context, Userprofile());
                },
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
