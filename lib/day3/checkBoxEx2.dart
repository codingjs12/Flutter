import 'package:flutter/material.dart';

void main() => runApp(CheckBoxEx2());

class CheckBoxEx2 extends StatefulWidget {
  const CheckBoxEx2({super.key});

  @override
  State<CheckBoxEx2> createState() => _CheckBoxEx2State();
}

class _CheckBoxEx2State extends State<CheckBoxEx2> {

  List<String> checkedList = [];
  List<String> imgList = [
    "dog.png", "fox.jpg", "fox2.jpg"
  ];

  void listChanged(String path, bool isChecked) {
    setState(() {
      if(isChecked) {
        checkedList.add(path);
      } else {
        checkedList.remove(path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              title: Text("자바"),
              leading: Checkbox(
                value: checkedList.contains(imgList[0]),
                onChanged: (value) => listChanged(imgList[0], value!)
              ),
            ),
            ListTile(
              title: Text("오라클"),
              leading: Checkbox(
                value: checkedList.contains(imgList[1]),
                onChanged: (value) => listChanged(imgList[1], value!)
              ),
            ),
            ListTile(
              title: Text("플러터"),
              leading: Checkbox(
                value: checkedList.contains(imgList[2]),
                onChanged: (value) => listChanged(imgList[2], value!)
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: checkedList.length,
                itemBuilder: (context, index) {
                  return Image.asset(checkedList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}