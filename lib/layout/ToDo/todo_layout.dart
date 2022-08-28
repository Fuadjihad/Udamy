// ignore_for_file: unused_local_variable, avoid_print, non_constant_identifier_names, use_function_type_syntax_for_parameters, must_be_immutable, unused_import, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/darkmod_cubit.dart';
import 'package:flutter_udemy/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_udemy/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_udemy/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_udemy/shared/components/components.dart';
import 'package:flutter_udemy/shared/components/constants.dart';
import 'package:flutter_udemy/shared/cubit/cubit.dart';
import 'package:flutter_udemy/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit().get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.title[cubit.currentStat],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      DarkModCubit().get(context).changeThem();
                    },
                    icon: const Icon(Icons.dark_mode_rounded))
              ],
            ),
            body: state is! AppGetDataBaseLoadingState
                ? cubit.screens[cubit.currentStat]
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            floatingActionButton: SingleChildScrollView(
              child: FloatingActionButton(
                onPressed: () {
                  if (cubit.isFloatOpen) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                      );
                    }
                  } else {
                    scaffoldKey.currentState
                        ?.showBottomSheet((context) => Container(
                              padding: const EdgeInsets.all(20.0),
                              width: double.infinity,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    defaultFormField(
                                      controller: titleController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Title must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Title',
                                      prefix: Icons.title_rounded,
                                      type: TextInputType.text,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    defaultFormField(
                                      controller: timeController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'time must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Time',
                                      prefix: Icons.watch_later_outlined,
                                      type: TextInputType.none,
                                      onTape: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    defaultFormField(
                                      controller: dateController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'date must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'Date',
                                      prefix: Icons.calendar_today,
                                      type: TextInputType.none,
                                      onTape: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2024-05-07'),
                                        ).then((value) => {
                                              dateController.text =
                                                  DateFormat.yMMMd()
                                                      .format(value!)
                                            });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .closed
                        .then((value) {
                      cubit.isBottomSheatShow(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    });
                    cubit.isBottomSheatShow(
                      isShow: true,
                      icon: Icons.add,
                    );
                  }
                },
                child: Icon(cubit.fabIcon),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              currentIndex: cubit.currentStat,
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
        },
      ),
    );
  }

  // Future<String> printName() async {
  //   return 'Fuad jihad';
  // }

}
