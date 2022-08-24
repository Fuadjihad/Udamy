import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/main_screen/cubit/cubit.dart';
import 'package:flutter_udemy/main_screen/cubit/states.dart';
import 'package:flutter_udemy/modules/bmi_app/bmi/bmi_screen.dart';

import '../shared/components/components.dart';

class AppScreens extends StatelessWidget {
  const AppScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Apps Screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiScreen(),
                        ));
                  },
                  child: Container(
                    padding:
                        const EdgeInsetsDirectional.only(bottom: 20, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'App Name',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: MainCubit().get(context).screens.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
