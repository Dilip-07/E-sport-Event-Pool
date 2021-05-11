import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/usermodel.dart';

class Editprofile extends StatefulWidget {
  final UserModel editProfile;
  Editprofile({Key key, @required this.editProfile}) : super(key: key);

  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final String collectionName = 'users';
  List paths = [];

  bool uploadStarted = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    nicknameController.dispose();
    dobController.dispose();
    phonenumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => uploadStarted = true);
      await updateDatabase();
      setState(() => uploadStarted = false);
      Fluttertoast.showToast(
        msg: "update Sucssesful",
        backgroundColor: Colors.red,
        textColor: Colors.black,
      );
    } else {
      Fluttertoast.showToast(
        msg: "fill data proporley",
        backgroundColor: Colors.red,
        textColor: Colors.black,
      );
    }
  }

  Future updateDatabase() async {
    final DocumentReference ref =
        firestore.collection('users').doc(widget.editProfile.toString());

    var _editProfile = {
      'nickName': nicknameController.text,
      'dob': dobController.text,
      'phoneNumner': nicknameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    await ref.update(_editProfile);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Feather.chevron_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        key: scaffoldKey,
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
                        SizedBox(height: height * .1),
                        TextFormField(
                          controller: nicknameController,
                          decoration: InputDecoration(
                            hintText: 'Nick Name',
                            labelText: 'Nick Name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Nick Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: dobController,
                          decoration: InputDecoration(
                            hintText: 'DD/MM/Year',
                            labelText: 'Date Of Birth',
                            suffixIcon: Icon(
                              Icons.date_range,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Date of birth';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: phonenumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            labelText: 'Phone Number',
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty || value.length < 10) {
                              return 'Please enter contact Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Create Password',
                            labelText: 'Create Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                          validator: (value) {
                            if (value.length < 6) {
                              return 'Password must be longer than 6';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        _submitButton(),
                        SizedBox(height: 10),
                        _divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: TextButton(
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
              'Update Profile',
              style: TextStyle(
                color: Color(0xff333951),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onPressed: () {},
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
