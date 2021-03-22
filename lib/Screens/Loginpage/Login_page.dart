import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:user/Screens/Registerpage/register_page.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff333951),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 30,
                          child: Divider(
                            color: Color(0xfff79c4f),
                            thickness: 2,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' Please Enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        _submitButton(),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff79c4f))),
                        ),
                        _divider(),
                        SizedBox(height: height * .050),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'E-',
          style: GoogleFonts.portLligatSans(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff333951),
          ),
          children: [
            TextSpan(
              text: 'Sport',
              style: TextStyle(color: Color(0xfff79c4f), fontSize: 30),
            ),
            TextSpan(
              text: 'Event',
              style: TextStyle(color: Color(0xff333951), fontSize: 30),
            ),
            TextSpan(
              text: 'Pool',
              style: TextStyle(color: Color(0xff333951), fontSize: 30),
            )
          ]),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Color(0xff333951)),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333951)))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: TextButton(
          onPressed: () {},
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff333951).withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'log In',
                style: TextStyle(
                  color: Color(0xff333951),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333951)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
