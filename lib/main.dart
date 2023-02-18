import 'package:flutter/material.dart';

import 'Screens/SignInPage/screen.dart';
import 'Screens/HomePage/screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const SignIn(),
        "/Home": (context) => const Home(),
      },
    );
  }
}
