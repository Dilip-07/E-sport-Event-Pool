import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/Screens/Loginpage/Login_page.dart';
import 'package:user/Screens/Welcomepage/welcomepage.dart';
import 'package:user/blocs/user_register/user_register_bloc.dart';
import 'package:user/di.dart';
import 'package:user/model/usermodel.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<UserRegisterBloc, UserRegisterState>(
        bloc: inject<UserRegisterBloc>(),
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
              backgroundColor: Colors.red,
              msg: state.errorMessage,
              textColor: Colors.black,
            );
          }
          if (state is RegisterAddedState) {
            Fluttertoast.showToast(
              msg: state.status.message,
              backgroundColor: Colors.white,
              textColor: Colors.green,
            );
            nicknameController.clear();
            dobController.clear();
            phonenumberController.clear();
            emailController.clear();
            passwordController.clear();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
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
                                height: 40,
                              ),
                              Text(
                                "SIGN UP",
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
                                obscureText: true,
                              ),
                              SizedBox(height: 20),
                              _submitButton(),
                              SizedBox(height: 10),
                              _divider(),
                              SizedBox(height: height * .010),
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
        });
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
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
              'Create Account',
              style: TextStyle(
                color: Color(0xff333951),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            inject<UserRegisterBloc>().add(
              AddRegister(
                userModel: UserModel(
                  dob: dobController.text.trim(),
                  email: emailController.text.trim(),
                  nickName: nicknameController.text.trim(),
                  password: passwordController.text.trim(),
                  phoneNumber: phonenumberController.text.trim(),
                ),
              ),
            );
          } else {
            Fluttertoast.showToast(
              msg: "Invalid details",
              backgroundColor: Colors.red,
              textColor: Colors.black,
            );
          }
        },
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

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333951)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Log In',
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
}
