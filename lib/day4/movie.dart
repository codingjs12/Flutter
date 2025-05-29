import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Movie(),
    );
  }
}

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {

  List<Map<String, Object>> list = [
    { "기생충" : 5 }, { "승부" : 3 }, { "파묘" : 4.5 }, { "미키 17" : 4 }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("영화 목록"),),
      body: Column(
        children: [
          
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Map item = list[index];
                return ListTile(
                  title: Text(item["기생충"]),
                );
              }
            ),
          ),

          ListTile(
            title: Text("기생충"),

            subtitle: Text("현재 평점 : ${ list[0].values }"),
          ),

          ListTile(
            title: Text("기생충"),
          ),
          ListTile(
            title: Text("기생충"),
          ),
        ],
      ),
    );
  }
}

