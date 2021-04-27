import 'package:authentication_app/screens/home.dart';
import 'package:authentication_app/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  checkkAuth() async {
    _auth.authStateChanges().listen((User user) {
      if (user != null) {
        _loading
            ? CircularProgressIndicator()
            : Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Future loginHelper() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (_formkey.currentState.validate()) {
      // Validating Current State of Form
      _formkey.currentState.save();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (error) {
        // Checking For FirebaseAuthException
        if (error.code == "user-not-found") {
          showErrorDialogBox("No User Found of That Email");
        } else if (error.code == "wrong-password") {
          showErrorDialogBox("Wrong Password Provided");
        }
      } catch (error) {
        print(error);
      }
    }
  }

  // Function to Navigate to Signup Page
  void navigateToSignup() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Signup()));
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
    this.checkkAuth();
    print(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/login.png"),
                  height: 300.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter E-mail";
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "E-Mail", border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter Password";
                      }
                      if (input.length < 6) {
                        return "Enter Minimun 6 Characters";
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  width: 400.0,
                  child: ElevatedButton(
                    child: Text(
                      "Login",
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
                    onPressed: loginHelper,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't Have Account?"),
                      TextButton(
                        onPressed: navigateToSignup,
                        child: Text("Signup"),
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
