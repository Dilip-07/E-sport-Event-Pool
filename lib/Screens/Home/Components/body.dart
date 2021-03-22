import 'package:flutter/material.dart';
import 'package:user/Screens/Welcomepage/welcomepage.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Text(
            "E-sport".toUpperCase(),
            style: Theme.of(context).textTheme.headline2.copyWith(
                color: Color(0xff333951), fontWeight: FontWeight.bold),
          ),
          Text(
            " e-sport is the platform to expierence \n the gaming in the community ",
            style: TextStyle(fontSize: 21, color: Color(0xff333951)),
          ),
          SizedBox(
            height: 30.0,
          ),
          FittedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff333951),
                borderRadius: BorderRadius.circular(34),
              ),
              child: Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    },
                    child: Text(
                      'get Started'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
