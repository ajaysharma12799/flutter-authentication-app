import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  final String svgImage = "assets/images/coding.svg";

  // Method to Navigate to Login Page
  void navigateToLogin(BuildContext context) {
    Navigator.popAndPushNamed(context, "/Signin");
  }

  // Method to Navigate to Signup Page
  void navigateToSignup(BuildContext context) {
    Navigator.popAndPushNamed(context, "/Signup");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("Autheee", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child:  Column(
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width as double ) / 1.5,
              height: (MediaQuery.of(context).size.height as double) / 1.5,
              child: SvgPicture.asset(svgImage),
            ),
            Container(
              width: (MediaQuery.of(context).size.width as double ) / 1.2,
              height: (MediaQuery.of(context).size.height as double) / 20,
              child: ElevatedButton(
                child: Text("Login",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () => navigateToLogin(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  )),
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height as double) / 35,
            ),
            Container(
              width: (MediaQuery.of(context).size.width as double ) / 1.2,
              height: (MediaQuery.of(context).size.height as double) / 20,
              child: ElevatedButton(
                child: Text("Signup",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 20,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                onPressed: () => navigateToSignup(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
