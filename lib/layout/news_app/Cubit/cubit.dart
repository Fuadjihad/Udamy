// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';
import 'package:flutter_udemy/modules/business_news/business_screen.dart';
import 'package:flutter_udemy/modules/science_news/science_screen.dart';
import 'package:flutter_udemy/modules/settings/settings.dart';
import 'package:flutter_udemy/modules/sports_news/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (currentIndex == 1) getSports();
    if (currentIndex == 2) getScience();
    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingBusinessState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'b3c089b504424ddcb6035df0f7900399'
      },
    ).then((value) {
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessDataErrorState(error.toString()));
    });
  }

  List<dynamic> sport = [];

  void getSports() {
    emit(NewsLoadingSportState());
    if (sport.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sport',
          'apiKey': 'b3c089b504424ddcb6035df0f7900399'
        },
      ).then((value) {
        sport = value?.data['articles'];
        emit(NewsGetSportDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportDataErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportDataSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsLoadingScienceState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'b3c089b504424ddcb6035df0f7900399'
        },
      ).then((value) {
        science = value?.data['articles'];
        emit(NewsGetScienceDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceDataErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceDataSuccessState());
    }
  }

  
}
