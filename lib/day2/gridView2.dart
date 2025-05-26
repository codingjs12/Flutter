import 'package:flutter/material.dart';

void main() {
  runApp(GridView2());
}

class GridView2 extends StatelessWidget {
  GridView2({super.key});

  List<String> path = [
    "cheom.jpeg", "dog.png", "fox.jpg", "fox2.jpg", "hana.jpg", "jeju2.jpg",
      "jeju3.jpg", "pohang.jpg", "seoul.jpg", "ulsan.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemCount: path.length,
          itemBuilder: (context, index) {
            return Container(
              child: Image.asset(
                path[index],
                fit: BoxFit.cover
              ),
            );
          },
        ),
      )
    );
  }
}