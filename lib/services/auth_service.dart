import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_example/ui/home_page.dart';
import 'package:login_example/ui/login_page.dart';

import '../error_handler.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signIn({String email, String password, BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      ErrorHandler().errorDialog(context, e);
      return null;
    }
  }

  signUp({String email, String password, BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      ErrorHandler().errorDialog(context, e);
    }
  }

  logout() {
    _auth.signOut();
  }
}
