import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Animations(),
    );
  }
}

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("오픈 컨테이너"),),
      body: Center(
        child: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: Duration(milliseconds: 500),
          closedBuilder: (context, action) {
            return ElevatedButton(
              onPressed: action,
              child: Text("상세 보기")
            );
          },
          openBuilder: (context, action) => DetailView()
        ),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상세 보기"),),
      body: Center(
        child: Text("상세 보기 페이지!"),
      ),
    );
  }
}




