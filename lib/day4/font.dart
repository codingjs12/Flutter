import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "기본 텍스트",
                style: TextStyle(
                  fontSize: 100
                ),
              ),
              Text(
                "폰트 텍스트",
                style: GoogleFonts.nanumGothic(fontSize: 100)
              ),
              Text(
                "Font Text2",
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 100,
                  color: Colors.blue
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

