import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatefulWidget {
  ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  State<ArchivedTasksScreen> createState() => _ArchivedTasksScreenState();
}

class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'Archived Tasks',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
