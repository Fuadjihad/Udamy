import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 15, 18, 32),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 15, 18, 32),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromARGB(255, 222, 23, 76),
            child: TextButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                child: Text(
                  'Calculate',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                )),
          )
        ],
      ),
    );
  }
}
