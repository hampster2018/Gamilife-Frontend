import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../Globals/user.dart';
import '../../User/functions.dart';

import 'dart:developer';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  Text text = const Text("Sign in");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          text,
          CupertinoButton(
              child: const Text("Sign Up"),
              onPressed: () async {
                updateLogout();
              })
        ]),
      ),
    );
  }

  Future<void> signUpUser() async {
    bool success = await logout();
    setState(() {
      if (success == true) {
        Navigator.pop(context);
      } else {
        text = const Text("Unsuccessful Logout");
      }
    });
    log("Logout success: $success");
  }
}
