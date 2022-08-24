import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/cubit.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';
import 'package:flutter_udemy/shared/network/remote/dio_helper.dart';

import 'Cubit/darkmod_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit = NewsCubit().get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    DarkModCubit().get(context).changeThem();
                  },
                  icon: Icon(Icons.dark_mode_rounded)
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomNavItem,
            ),
          );
        },
      ),
    );
  }
}
