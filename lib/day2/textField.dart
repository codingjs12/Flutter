import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldEx());
}

class TextFieldEx extends StatefulWidget {
  const TextFieldEx({super.key});

  @override
  State<TextFieldEx> createState() => _TextFieldState(

  );
}

class _TextFieldState extends State<TextFieldEx> {

  TextEditingController _txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child : Column(
            children: [
              TextField(
                controller: _txtCtrl,
                decoration: InputDecoration(
                  labelText: "텍스트 입력하삼",
                  hintText: "ex) test@test.com",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.check_circle),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100]
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    print("입력값 : ${_txtCtrl.text}");
                  },
                  child: Text("클릭!")
              )
            ],
          )
        ),
      )
    );
  }
}


