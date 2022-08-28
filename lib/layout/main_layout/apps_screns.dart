import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/main_layout/cubit/apps__cubit.dart';
import 'package:flutter_udemy/layout/main_layout/cubit/apps_states.dart';
import 'package:flutter_udemy/shared/components/components.dart';

class AppsScrens extends StatelessWidget {
  const AppsScrens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppsCubit(),
      child: BlocConsumer<AppsCubit, AppsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppsCubit().get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView.separated(
              itemBuilder: (context, index) => mainW(
                context,
                cubit.title[index],
                cubit.apps[index],
                cubit.image[index],
              ),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: cubit.apps.length,
            ),
          );
        },
      ),
    );
  }
}
