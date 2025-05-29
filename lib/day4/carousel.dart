import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Carousel(),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  List<String> list = [
    "fox.jpg", "fox2.jpg", "hana.jpg", "dog.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          items: list.map((item) => Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Image.asset(item, fit:BoxFit.cover)
          )).toList(),
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1,
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
