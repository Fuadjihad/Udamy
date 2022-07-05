import 'package:flutter/material.dart';
import 'package:flutter_udemy/login_screen.dart';
import 'counter_screen.dart';
import 'home_page.dart';
import 'login_screen.dart';
import 'messenger_screen.dart';
import 'users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
