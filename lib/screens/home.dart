import 'package:authentication_app/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/screens/productPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser;
  User currentFirebaseuser; // Firebase Current User

  Future checkAuth() async {
    // Checking if User is Still Authenticated or Not
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signin()));
      }
    });
  }

  Future getUser() async {
    User fetchedUser = await FirebaseAuth.instance.currentUser;
    if (fetchedUser != null) {
      this.currentFirebaseuser = fetchedUser; // Check This Problem
    }
  }

  void signoutHelper() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuth();
    this.getUser();
  }

  // getUser() async {
  //   User user = await _auth.currentUser;
  //   await user?.reload();
  //   user = await _auth.currentUser;

  //   if (user != null) {
  //     this.firebaseUser = user;
  //     this.isLoggedIn = true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Products Page")],
        ),
      ),
      body: ProductPage(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("A"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.purple,
              ),
              accountName: Text("Ajay Sharma"),
              accountEmail: Text("ajay@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: signoutHelper,
            ),
          ],
        ),
      ),
    );
  }
}
