import 'package:authentication_app/Auth/GoogleSignHelper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // Method to Navigate to SigninScreen
  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.popAndPushNamed(context, "/Signin");
  }

  User user;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();
  String displayEmail;

  void signoutHelper(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    navigateToLogin(context);
  }

  loadCurrentUser() async {
    User currentUser = await _getCurrentUser();
    setState(() {
      this.user = currentUser;
      displayEmail = this.user.email;
    });
  }

  Future _getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    this.loadCurrentUser();
  }

  String initialName() {
    String nameInitial = displayEmail.substring(0, 1).toUpperCase();
    return nameInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(displayEmail),
            currentAccountPicture: CircleAvatar(
              child: Text(initialName()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              signoutHelper(context);
              _googleSignInProvider.logout();
            },
          ),
        ],
      ),
    );
  }
}
