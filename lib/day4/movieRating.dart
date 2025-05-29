import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieRating(),
    );
  }
}

class MovieRating extends StatefulWidget {

  const MovieRating({super.key});

  @override
  State<MovieRating> createState() => _MovieRatingState();
}

class _MovieRatingState extends State<MovieRating> {

  List<String> list = ["기생충", "승부", "파묘", "미키17", "올드보이"];
  Map<String, double> ratings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("영화 목록"),),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String movie = list[index];
          return Card (
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  RatingBar.builder(
                    initialRating: ratings[movie] ?? 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        ratings[movie] = rating;
                      });
                    },
                  ),
                  Text("현재 평점 : ${ratings[movie] ?? "없음"}")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
