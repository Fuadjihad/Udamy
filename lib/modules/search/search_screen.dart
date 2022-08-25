import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/layout/news_app/Cubit/cubit.dart';

import '../../layout/news_app/Cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editingController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit().get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                  controller: editingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChang: (String value) {
                    NewsCubit().get(context).getSearch(value);
                  },
                  label: 'Search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                ),
                Expanded(
                  child: buildArticlItem(list, context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
