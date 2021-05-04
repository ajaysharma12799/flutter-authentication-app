import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final String signupImage = "assets/images/register.png";

  // Method to Navigate to Login Page
  void navigateToLogin() {
    Navigator.popAndPushNamed(context, "/Signin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width as double) / 2,
                height: (MediaQuery.of(context).size.height as double) / 2,
                child: Image.asset(signupImage),
              ),
              Container(
                width: (MediaQuery.of(context).size.width as double) / 1.1,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Quicksand",
                  ),
                  decoration: InputDecoration(
                    labelText: "E-Mail",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height as double) / 40,
              ),
              Container(
                width: (MediaQuery.of(context).size.width as double) / 1.1,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Quicksand",
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height as double) / 50,
              ),
              Container(
                width: (MediaQuery.of(context).size.width as double) / 1.1,
                height: (MediaQuery.of(context).size.height as double) / 20,
                child: ElevatedButton(
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height as double) / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width as double) / 4.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2.0,
                      height: 5.0,
                    ),
                  ),
                  Container(
                    child: Text(
                      "  Or Signup With  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Quicksand",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width as double) / 4.0,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2.0,
                      height: 5.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height as double) / 40,
              ),
              Container(
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up With Google",
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already a Member ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Quicksand",
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: "Quicksand",
                        fontSize: 18,
                      ),
                    ),
                    onPressed: navigateToLogin,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
