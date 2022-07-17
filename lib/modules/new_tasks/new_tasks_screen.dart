import 'package:flutter/material.dart';

class NewTasksScreen extends StatefulWidget {
  NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      child: const Text(
        'New Tasks 13',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
