import 'package:flutter/material.dart';

void main() {
  runApp(const Gesture2());
}

class Gesture2 extends StatefulWidget {
  const Gesture2({super.key});

  @override
  State<Gesture2> createState() => _Gesture2State();
}

class _Gesture2State extends State<Gesture2> {

  bool isDark = false;
  var color_white = Colors.white;
  var color_black = Colors.black;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : GestureDetector(
        onTap: (){
          setState(() {
            isDark = !isDark;
          });
          print(isDark);
        },
        child: Container(
          width: 150,
          height: 150,
          color: isDark ? color_black : color_white,
          child: Center(
            child: Text(
              "클릭!!!",
              style: TextStyle(
                color : isDark ? color_white : color_black
              ),
            ),
          ),
        ),
      )
    );
  }
}
