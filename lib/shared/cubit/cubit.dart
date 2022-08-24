// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  AppCubit get(context) => BlocProvider.of(context);

  int currentStat = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> title = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeNavBar(int index) {
    currentStat = index;
    emit(AppChangeBottomNavBarState());
  }

  Database? database;

  List<Map>? newTasks = [];
  List<Map>? doneTasks = [];
  List<Map>? archiveTasks = [];

  void createDatabase() {
    openDatabase(
      'TODO.db',
      version: 1,
      onCreate: (database, version) {
        print('Database Created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT )')
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print('Error When Create Table: ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO tasks (title, date, time, status) VALUES("$title","$date","$time","new")',
      )
          .then((value) {
        print('$value inserted successful');
        emit(AppInsertDataBaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('error when insert ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    emit(AppGetDataBaseLoadingState());

    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks!.add(element);
        } else if (element['status'] == 'done') {
          doneTasks!.add(element);
        } else {
          archiveTasks!.add(element);
        }
      });

      emit(AppGetDataBaseState());
    });
  }

  void updateDatabase({
    required String status,
    required int id,
  }) async {
    database?.rawDelete(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDelateDataBaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDelateDataBaseState());
    });
  }

  bool isFloatOpen = false;
  IconData fabIcon = Icons.edit;

  void isBottomSheatShow({
    required bool isShow,
    required IconData icon,
  }) {
    isFloatOpen = isShow;
    icon = fabIcon;
    emit(AppChangeBottomNavBarState());
  }
}
