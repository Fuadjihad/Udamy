import 'package:flutter/material.dart';
import 'package:flutter_udemy/modules/arcived_tasks/arcived_tasks_screen.dart';
import 'package:flutter_udemy/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_udemy/modules/new_tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

int currentStat = 0;
List<Widget> Screens = [
  NewTasksScreen(),
  DoneTasksScreen(),
  ArchivedTasksScreen(),
];

List<String> Title = [
  'New TAsks',
  'Done Tasks',
  'Archived Tasks',
];

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Title[currentStat],
        ),
      ),
      body: Screens[currentStat],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentStat = index;
          });
        },
        currentIndex: currentStat,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Tasks',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archive',
          )
        ],
      ),
    );
  }
}
