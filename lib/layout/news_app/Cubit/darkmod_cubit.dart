import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';
import 'package:flutter_udemy/shared/network/local/cache_helper.dart';

class DarkModCubit extends Cubit<NewsStates> {
  DarkModCubit() : super(NewsInitialState());

  DarkModCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeThem({bool? sherd}) {
    if (sherd != null) {
      isDark = sherd;
      emit(NewsChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolen(isDark: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeState());
      });
    }
  }
}
