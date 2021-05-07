import 'package:authentication_app/screens/splashScreen.dart';
import 'package:authentication_app/screens/signinScreen.dart';
import 'package:authentication_app/screens/signupScreen.dart';
import 'package:authentication_app/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Authentication Application",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(
              // Text Custom FontSize and Theme
              title: TextStyle(fontFamily: "Quicksand", fontSize: 18)),
          appBarTheme: AppBarTheme(
              // AppBar Custom FontSize and Theme
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: "Quicksand", fontSize: 30)))),
      initialRoute: "/SplashScreen",
      routes: <String, WidgetBuilder>{
        "/SplashScreen": (BuildContext context) => SplashScreen(),
        "/Signin": (BuildContext context) => Signin(),
        "/Signup": (BuildContext context) => Signup(),
        "/HomeScreen": (BuildContext context) => HomeScreen()
      },
    );
  }
}
