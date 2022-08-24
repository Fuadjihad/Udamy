// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final int age;
  final double result;
  final bool isMale;

  BmiResultScreen({
    required this.age,
    required this.result,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 19, 34),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 15, 30),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
            )),
        title: Text(
          'BMI RESULT',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white),
            ),
            Text(
              'Result : ${result.round()}',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
