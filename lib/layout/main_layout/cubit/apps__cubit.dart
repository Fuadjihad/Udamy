//import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/ToDo/todo_layout.dart';
import 'package:flutter_udemy/layout/main_layout/cubit/apps_states.dart';
import 'package:flutter_udemy/layout/news_app/news_layout.dart';
import 'package:flutter_udemy/modules/bmi_app/bmi/bmi_screen.dart';

class AppsCubit extends Cubit<AppsStates> {
  AppsCubit() : super(AppInitialStales());
  AppsCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List apps = [
    BmiScreen(),
    HomeLayout(),
    NewsLayout(),
  ];
  List title = [
    'Bmi',
    'ToDo App',
    'News App',
  ];
  List<String> image = [
    'https://www.codester.com/static/uploads/items/000/026/26079/icon.png',
    'https://www.onmsft.com/wp-content/uploads/2019/05/todo.jpg',
    'https://i.pinimg.com/originals/c9/b8/b8/c9b8b8617e6109fab1c49de7dffdf943.jpg',
  ];
}
