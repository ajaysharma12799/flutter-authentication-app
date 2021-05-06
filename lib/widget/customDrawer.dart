import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatelessWidget {
  // Method to Navigate to SigninScreen
  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.popAndPushNamed(context, "/Signin");
  }

  void signoutHelper(BuildContext context) async {
    print(FirebaseAuth.instance.currentUser);
    await FirebaseAuth.instance.signOut();
    navigateToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("accountName"),
            accountEmail: Text("accountEmail@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              signoutHelper(context);
            },
          ),
        ],
      ),
    );
  }
}
