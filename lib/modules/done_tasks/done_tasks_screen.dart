import 'package:flutter/material.dart';

class DoneTasksScreen extends StatefulWidget {
  DoneTasksScreen({Key? key}) : super(key: key);

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'Done Tasks 122',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
