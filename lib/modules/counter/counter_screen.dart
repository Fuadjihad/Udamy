// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/modules/counter/cubit/cubit.dart';
import 'package:flutter_udemy/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Counter'),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: Text(
                        'MINUS',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: Text(
                        'PLUS',
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
