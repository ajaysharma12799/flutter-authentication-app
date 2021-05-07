import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isSignedIn;

  GoogleSignInProvider() {
    _IsSignedIn = false;
  }

  bool get _IsSignedIn => _isSignedIn;

  set _IsSignedIn(bool _IsSignedIn) {
    this._isSignedIn = _IsSignedIn;
  }

  Future login() async {
    _isSignedIn = true;
    final user = await GoogleSignIn().signIn();
    if (user == null) {
      _isSignedIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = await GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      _isSignedIn = false;
    }
  }

  void logout() async {
    await _googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
