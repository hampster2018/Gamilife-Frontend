import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';

import '../../Globals/user.dart';
import '../../User/functions.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  Text text = const Text("Please Sign in");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          text,
          CupertinoButton(
              child: const Text("Login"),
              onPressed: () async {
                updateLogin();
              }),
          CupertinoButton(
              child: const Text("Logout"),
              onPressed: () async {
                updateLogout();
              })
        ]),
      ),
    );
  }

  Future<void> updateLogin() async {
    if (isLoggedIn == true) {
      setState(() {
        text = const Text("User is already signed in");
      });
    } else {
      user = await login("root", "password");
      setState(() {
        text = Text(user.username);
      });
      log(user.username);
    }
  }

  Future<void> updateLogout() async {
    bool success = await logout();
    setState(() {
      if (success == true) {
        text = const Text("Successfully Signed out");
      } else {
        text = const Text("User wasn't signed in");
      }
    });
    log("Logout success: $success");
  }
}
