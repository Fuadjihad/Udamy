// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/shared/components/components.dart';
import 'package:flutter_udemy/shared/components/constants.dart';
import 'package:flutter_udemy/shared/cubit/cubit.dart';
import 'package:flutter_udemy/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit().get(context).newTasks;

        return buildTask(tasks: tasks);
      },
    );
  }
}
