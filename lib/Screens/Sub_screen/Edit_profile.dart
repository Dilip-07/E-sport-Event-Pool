import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isEdit = true; //To edit Bio
  FocusNode nickNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode dobFocus = FocusNode();
  FocusNode phoneNumberFocus = FocusNode();
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

  String uid;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) async {
      if (user != null) {
        setState(() {
          uid = user.uid;
        });
      }
    });
    super.initState();
  }

  void updatenickname() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'nickName': nicknameController.text.trim()});
  }

  void updatedob() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'dob': dobController.text.trim()});
  }

  void updatecontactno() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'phoneNumber': dobController.text.trim()});
  }

  void updateemail() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'email': emailController.text.trim()});
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
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
        builder: (context, snapshots) {
          if (!snapshots.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            nicknameController.text = snapshots.data['nickName'];
            dobController.text = snapshots.data['dob'];
            emailController.text = snapshots.data['email'];
            phonenumberController.text = snapshots.data['phoneNumber'];
            return SingleChildScrollView(
              child: Container(
                height: height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: height * .1),
                              TextFormField(
                                focusNode: nickNameFocus,
                                enabled: isEdit,
                                controller: nicknameController,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  updatenickname();
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                focusNode: dobFocus,
                                enabled: isEdit,
                                controller: dobController,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  updatedob();
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                focusNode: phoneNumberFocus,
                                enabled: isEdit,
                                controller: phonenumberController,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  updatecontactno();
                                },
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                focusNode: emailFocus,
                                enabled: isEdit,
                                controller: emailController,
                                textInputAction: TextInputAction.send,
                                onFieldSubmitted: (value) {
                                  updateemail();
                                },
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              // TextFormField(
                              //   controller: passwordController,
                              //   decoration: InputDecoration(
                              //     hintText: 'Create Password',
                              //     labelText: 'Create Password',
                              //     suffixIcon: Icon(
                              //       Icons.lock_outline,
                              //     ),
                              //   ),
                              //   validator: (value) {
                              //     if (value.length < 6) {
                              //       return 'Password must be longer than 6';
                              //     }
                              //     return null;
                              //   },
                              // ),
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
              ),
            );
          }
        },
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          updatenickname();
          updatedob();
          updatecontactno();
          updateemail();
        },
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
