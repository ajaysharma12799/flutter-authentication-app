import 'dart:async';
import 'package:authentication_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future signupHelper() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (_formKey.currentState.validate()) {
      // Validating Current State of Form
      _formKey.currentState.save();
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // Show Success DialogBox
        showSuccessDialogBox(
            "Registered Successfully, Will be Redirected To HomePage Within 3 Seconds");

        // CountDown Timer For Redirection
        const threeSecond = const Duration(seconds: 3);
        Timer(threeSecond, navigateToLogin);
      } on FirebaseAuthException catch (error) {
        // Checking For FirebaseAuthException
        if (error.code == "email-already-in-use") {
          showErrorDialogBox("Email Already in Use");
        }
      } catch (error) {
        print(error);
      }
    }
  }

  // Function to Navigate to Login Page
  void navigateToLogin() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Signin()));
  }

  void showSuccessDialogBox(String successMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text(successMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void showErrorDialogBox(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/register.png"),
                  height: 300.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "E-Mail", border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  width: 400.0,
                  child: ElevatedButton(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(10.0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                    onPressed: signupHelper,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't Have Account?"),
                      TextButton(
                        onPressed: navigateToLogin,
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
