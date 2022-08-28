// ignore_for_file: unused_import, prefer_const_constructors, unused_label, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/main_layout/apps_screns.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/cubit.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';
import 'package:flutter_udemy/layout/news_app/news_layout.dart';
import 'package:flutter_udemy/modules/login/login_screen.dart';
import 'package:flutter_udemy/shared/network/local/cache_helper.dart';
import 'package:flutter_udemy/shared/network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/ToDo/todo_layout.dart';
import 'layout/news_app/Cubit/darkmod_cubit.dart';
import 'modules/bmi_app/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_screen.dart';
import 'modules/messenger/messenger_screen.dart';
import 'modules/users/users_screen.dart';
import 'shared/bloc_observer.dart';

// comment
//todo thee most important thing in programing is istemraria
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  var isDark = CacheHelper.getBoolen(isDark: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  var isDark;
  MyApp(
    this.isDark,
  );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              DarkModCubit()..changeThem(sherd: isDark),
        )
      ],
      child: BlocConsumer<DarkModCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 20,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('1c1c1e'),
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('1c1c1e'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('1c1c1e'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.grey,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 20,
                backgroundColor: HexColor('1c1c1e'),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: HexColor('1c1c1e'),
              ),
            ),
            themeMode: DarkModCubit().get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: AppsScrens(),
          );
        },
      ),
    );
  }
}
