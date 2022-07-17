import 'package:flutter/material.dart';
import 'package:flutter_udemy/modules/login/login_screen.dart';
import 'layout/home_layout.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_screen.dart';
import 'modules/messenger/messenger_screen.dart';
import 'modules/users/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
