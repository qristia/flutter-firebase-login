import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_example/services/auth_service.dart';
import 'package:login_example/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailTc = TextEditingController();
  final passwordTc = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void handleLoginButton() {
    final email = emailTc.text.trim();
    final password = passwordTc.text;

    if (email != null && password != null) {
      final user = AuthService()
          .signIn(email: email, password: password, context: context);

      if (user != null) {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => HomePage()));
        // Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              CupertinoTextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailTc,
              ),
              SizedBox(height: 20),
              CupertinoTextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordTc,
                suffix: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text('-'),
                ),
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                child: Text('login'),
                onPressed: handleLoginButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
