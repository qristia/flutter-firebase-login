import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_example/services/auth_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('you are signed in'),
            CupertinoButton.filled(
              child: Text('logout'),
              onPressed: () {
                AuthService().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
