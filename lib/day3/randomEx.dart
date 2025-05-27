import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(RandomEx());

class RandomEx extends StatefulWidget {
  const RandomEx({super.key});

  @override
  State<RandomEx> createState() => _RandomExState();
}

class _RandomExState extends State<RandomEx> {

  Random ran = Random();

  List<Widget> list = [];

  int idx = 0;

  void removeItem(int index) {
    if(index == idx) {
      idx++;
      setState(() {
        list.removeAt(0);
      });
      if(list.length == 0) {
        idx = 0;
        createList();
      }
    }
  }

  Offset generatePosition(double width, double height) {
    double x = ran.nextDouble() * (width - 50);
    double y = ran.nextDouble() * (height - 50);
    return Offset(x, y);
  }

  void createList() {

    List<Widget> tempList = [];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    for(int i = 0; i < 10; i++) {
      Offset position = generatePosition(width, height);
      tempList.add(
          Positioned(
              left: position.dx,
              top : position.dy,
              child: GestureDetector(
                onTap: () {
                  removeItem(i);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color : Colors.purple[100],
                  child: Center(
                    child: Text(
                      (i+1).toString(),
                      style: TextStyle(
                          fontSize: 40
                      ),
                    ),
                  ),
                ),
              )
          )
      );
    }
    setState(() {
      list = tempList;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      createList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: list,
        ),
      ),
    );
  }
}
