// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/cubit.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit().get(context).business;

        return articalItem(list,context);
      },
    );
  }
}
