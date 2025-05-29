import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Confetti()
    );
  }
}

class Confetti extends StatefulWidget {
  const Confetti({super.key});

  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {

  late ConfettiController ctrl;
  @override
  void initState() {
    super.initState();

    ctrl = ConfettiController(
      duration: Duration(
        seconds: 2
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                ctrl.play();
              },
              child: Text("안녕"),
            ),
            ConfettiWidget(
              confettiController: ctrl,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: [?Colors.blue[100], ?Colors.blue[200], ?Colors.blue[300], ?Colors.blue[400], ?Colors.blue[500]],
              numberOfParticles: 300,
            ),

          ],
        ),
      ),
    );
  }
}

