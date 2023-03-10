import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../Globals/user.dart';
import '../../User/functions.dart';

import 'dart:developer';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  Text text = Text("Welcome $user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          text,
          CupertinoButton(
              child: const Text("Logout"),
              onPressed: () async {
                updateLogout();
              })
        ]),
      ),
    );
  }

  Future<void> updateLogout() async {
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
