import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final String signinImage = "assets/images/login.png";

  // Method to Navigate to Signup Page
  void navigateToSignup() {
    Navigator.popAndPushNamed(context, "/Signup");
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
                child: Image.asset(signinImage),
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
                    "Login",
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
                      "  Or Login With  ",
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
                  text: "Login With Google",
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't Have Account ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Quicksand",
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: "Quicksand",
                        fontSize: 18,
                      ),
                    ),
                    onPressed: navigateToSignup,
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
