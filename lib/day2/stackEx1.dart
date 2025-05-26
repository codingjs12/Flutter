import 'package:flutter/material.dart';

void main() {
  runApp(const StackEx1());
}

class StackEx1 extends StatelessWidget {
  const StackEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue[900],
            ),
            Container(
              width: 170,
              height: 170,
              color: Colors.blue[800],
              margin: EdgeInsets.all(20),
            ),
            Container(
              width: 140,
              height: 140,
              color: Colors.blue[700],
              margin: EdgeInsets.all(40),
            ),
            Container(
              width: 110,
              height: 110,
              color: Colors.blue[600],
            ),
          ],
        ),
      )
    );
  }
}


