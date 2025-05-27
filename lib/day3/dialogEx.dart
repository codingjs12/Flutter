import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: DialogEx(),
      ),
    );
  }
}



class DialogEx extends StatelessWidget {
  const DialogEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("다이얼로그"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("삭제 알림"),
                    content: Text("삭제 하실?"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("삭제"),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("취소"),
                      ),
                    ],
                  );
                }
            ),
            child: Text("클릭!!!")
        ),
      ),
    );
  }
}
