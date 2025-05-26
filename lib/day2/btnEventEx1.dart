import 'package:flutter/material.dart';

void main() {
  runApp(const BtnEventEx1());
}

class BtnEventEx1 extends StatefulWidget {
  const BtnEventEx1({super.key});

  @override
  State<BtnEventEx1> createState() => _BtnEventEx1State();
}

class _BtnEventEx1State extends State<BtnEventEx1> {

  String up = "위로";
  String down = "아래로";
  bool isClick = false;
  var _dBlue = Colors.blue[900];
  var _blue = Colors.blue[100];
  bool upDown = false;
  var _align = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: isClick ? Alignment.topCenter : _align,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                isClick = !isClick;

              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                isClick ? _blue : _dBlue,
              )
            ),
            child: Text(
              isClick ? down : up,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}

