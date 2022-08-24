import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/ToDo/todo_layout.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';
import 'package:flutter_udemy/layout/news_app/news_layout.dart';
import 'package:flutter_udemy/main_screen/cubit/states.dart';
import 'package:flutter_udemy/modules/bmi_app/bmi/bmi_screen.dart';

import '../../modules/messenger/messenger_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialStat());
  MainCubit get(context) => BlocProvider.of(context);

  List screens = [
    BmiScreen(),
    HomeLayout(),
    NewsLayout(),
    MassengerScreen(),
  ];
  int curuntIndex = 0;
  void ChangeScren() 
  {
    
  }
}
