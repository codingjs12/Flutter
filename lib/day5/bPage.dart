import 'package:flutter/material.dart';

void main() => runApp(BPage());

class BPage extends StatelessWidget {
  final String? message;

  const BPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BPage"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message ?? "BPage"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text("이전 페이지로 돌아가기")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    "B가 보내는 값"
                  );
                },
                child: Text("값 포함 페이지로 돌아가기")
            ),
          ],
        ),
      ),
    );
  }
}

