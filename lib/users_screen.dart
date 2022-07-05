// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UsersModel {
  final int id;
  final String name;
  final String phone;

  UsersModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  List<UsersModel> users = [
    UsersModel(
      id: 1,
      name: 'Fuad abumadi',
      phone: '+972526398799',
    ),
    UsersModel(
      id: 2,
      name: 'Mohamed Ali',
      phone: '+9725261563699',
    ),
    UsersModel(
      id: 3,
      name: 'Same mohaned',
      phone: '+972526345592',
    ),
    UsersModel(
      id: 4,
      name: 'Shukre abujaj',
      phone: '+9728542398799',
    ),
    UsersModel(
      id: 1,
      name: 'Fuad abumadi',
      phone: '+972526398799',
    ),
    UsersModel(
      id: 2,
      name: 'Mohamed Ali',
      phone: '+9725261563699',
    ),
    UsersModel(
      id: 3,
      name: 'Same mohaned',
      phone: '+972526345592',
    ),
    UsersModel(
      id: 4,
      name: 'Shukre abujaj',
      phone: '+9728542398799',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildItem(UsersModel user) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}