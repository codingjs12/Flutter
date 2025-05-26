import 'package:flutter/material.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatelessWidget {
  Calc({super.key});

  TextEditingController _txtCtrl = TextEditingController();
  List<String> labels = [
    'C', '(', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '00', '.', '='
  ];

  var _blue = Colors.blue;

  var color = (num) {
    bool _color = false;
    if((num+1) % 4 == 0) {
      _color = true;
    }
    return _color;
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _txtCtrl,
              decoration: InputDecoration(
                labelText: "텍스트 입력하삼",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100]
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemCount: labels.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: (){
                      print(labels[index]);
                      _txtCtrl.text = labels[index];
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: color(index) ? _blue : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      )
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyle(fontSize: 20),
                    )
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}


