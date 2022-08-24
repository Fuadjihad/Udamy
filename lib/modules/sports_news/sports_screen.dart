import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/Cubit/cubit.dart';
import '../../layout/news_app/Cubit/states.dart';
import '../../shared/components/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit().get(context).sport;

        return articalItem(list,context);
      },
    );
  }
}
//setting