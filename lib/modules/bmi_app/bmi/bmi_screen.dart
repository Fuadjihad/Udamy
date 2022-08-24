import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_udemy/modules/bmi_app/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

bool isMale = true;
double hight = 120.0;
int weight = 60;
int age = 18;

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 19, 34),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 15, 30),
        elevation: 0,
        // backgroundColor: Color.fromARGB(255, , g, b),
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isMale
                            ? Color.fromARGB(255, 230, 20, 75)
                            : Color.fromARGB(255, 29, 30, 56),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Image(
                                color: Colors.white,
                                // width: 70,
                                // height: 100,
                                image: AssetImage(
                                  'assets/images/mars.png',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Expanded(
                              child: Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isMale
                            ? const Color.fromARGB(255, 26, 27, 45)
                            : const Color.fromARGB(255, 230, 20, 75),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Expanded(
                              flex: 2,
                              child: const Image(
                                color: Colors.white,
                                width: 70,
                                height: 70,
                                image: AssetImage(
                                  'assets/images/female.png',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: const Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 29, 30, 56),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    'HIGHT',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // ignore: prefer_const_constructors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        '${hight.round()}',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        'CM',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    thumbColor: Color.fromARGB(255, 230, 20, 77),
                    activeColor: Colors.white30,
                    value: hight,
                    max: 240,
                    min: 80,
                    onChanged: (value) {
                      setState(() {
                        hight = value;
                      });
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 29, 30, 56),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'WEIGHT',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$weight',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color.fromARGB(255, 66, 70, 81),
                              mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                              onPressed: () {
                                setState(() {});
                                weight--;
                              },
                            ),
                            FloatingActionButton(
                              backgroundColor: Color.fromARGB(255, 66, 70, 81),
                              mini: true,
                              child: Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                setState(() {});
                                weight++;
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 29, 30, 56),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'AGE',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$age',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color.fromARGB(255, 66, 70, 81),
                              mini: true,
                              child: Icon(
                                Icons.remove,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            FloatingActionButton(
                              backgroundColor: Color.fromARGB(255, 66, 70, 81),
                              mini: true,
                              child: Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromARGB(255, 222, 23, 76),
            child: TextButton(
                onPressed: () {
                  var result = weight / pow(hight / 100, 2);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                        age: age,
                        result: result,
                        isMale: isMale,
                      ),
                    ),
                  );
                },
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

//var result = weight / pow(height / 100, 2);
