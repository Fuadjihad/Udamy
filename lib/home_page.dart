// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 43, 29, 95),
        leading: const Icon(Icons.menu),
        title: const Text('Home page'),
        actions: [
          IconButton(
            onPressed: () {
              print('clicked');
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(30) 
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment:Alignment.bottomCenter ,
                children: [
                  Image(
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/07/07/12/34/lime-2481358_960_720.jpg'
                    ),
                    ),
                  Container(
                    width: 300.0,
                    color: Colors.orange.withOpacity(0.5),
                    child: Text(
                      'Masha alah',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
