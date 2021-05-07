import 'package:authentication_app/Auth/GoogleSignHelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // Method to Navigate to HomeScreen
  void navigateToHomeScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, "/HomeScreen");
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();

  void signupHandler() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (_key.currentState.validate()) {
      // Checking if Form_Key Current State is Validated
      _key.currentState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // Showing DialogBox
        showDialogBox("Account Created Successfully", false);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          showDialogBox("The password provided is too weak.", true);
        } else if (error.code == 'email-already-in-use') {
          showDialogBox("The account already exists for that email.", true);
        }
      } catch (error) {
        // Printing If Any Other Error Occurs
        print(error);
      }
    }
  }

  void checkAuth() async {
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        navigateToHomeScreen(context);
      }
    });
  }

  showDialogBox(String message, bool flag) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return flag
              ? AlertDialog(
                  title: Text("Error"),
                  content: Text(message),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Ok"),
                    )
                  ],
                )
              : AlertDialog(
                  title: Text("Success"),
                  content: Text(message),
                  actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Ok"),
                      )
                    ]);
        });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuth();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Email";
                      }
                    },
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 63, 111, 1),
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(255, 63, 111, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height as double) / 40,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width as double) / 1.1,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Password";
                      }
                      if (value.length < 6) {
                        return "Password Should be Above 6 Character";
                      }
                    },
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 63, 111, 1),
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(255, 63, 111, 1),
                      ),
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: signupHandler,
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height as double) / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width:
                          (MediaQuery.of(context).size.width as double) / 4.0,
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
                      width:
                          (MediaQuery.of(context).size.width as double) / 4.0,
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
                    onPressed: () => _googleSignInProvider.login(),
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
      ),
    );
  }
}
