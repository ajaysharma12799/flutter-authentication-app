import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  void signoutHelper(BuildContext context) async {
    print(FirebaseAuth.instance.currentUser);
    await FirebaseAuth.instance.signOut();
    navigateToLogin(context);
  }

  loadCurrentUser() async {
    User currentUser = await _getCurrentUser();
    // print(currentUser);
    setState(() {
      this.user = currentUser;
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
    String nameInitial = user.email.substring(0, 1).toUpperCase();
    return nameInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: Text(initialName()),
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
