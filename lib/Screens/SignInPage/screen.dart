import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/Screens/SignUpPage/screen.dart';
import 'dart:developer';

import '../../Globals/user.dart';
import '../../User/functions.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  Text text = const Text("Sign Up");

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          text,
          CupertinoTextField(controller: username),
          CupertinoTextField(controller: password)
          CupertinoButton(child: Text("Make new account"), onPressed: {u})
        ]),
      ),
    );
  }

  Future<void> SignUp() async {
    if (isLoggedIn == true) {
      setState(() {
        text = const Text("User is already signed in");
      });
    } else {
      user = await login("root", "password");
      setState(() {
        Navigator.pushNamed(context, '/Home');
      });
    }
    log('$user signed in');
  }
}
