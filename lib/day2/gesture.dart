import 'package:flutter/material.dart';

void main() {
  runApp(const GestureEx1());
}

class GestureEx1 extends StatelessWidget {
  const GestureEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: (){
              print("눌렀다");
            },
            child: Container(
              width: 150,
              height: 150,
              color: Colors.cyan,
              child: Center(
                child: Text(
                  "눌러라!!!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}


