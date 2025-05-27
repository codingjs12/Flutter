import 'package:flutter/material.dart';

void main() {
  runApp(const DropDown());
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  String? selectedItem = "JAVA"; // 1. String? 으로 변환 nullable type

  List<String> list = [
    "JAVA", "ORACLE", "HTML/CSS", "Flutter"
  ];

  List<String> path = ["dog.png", "fox.jpg", "fox2.jpg", "hana.jpg"];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Center(
          child: Column(
            children: [
              DropdownButton(
                value : selectedItem,
                icon : Icon(Icons.arrow_downward),
                style: TextStyle(color: Colors.blue),
                items: list.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item)
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value!; // 2.value! null 이 아님 강제함
                    index = list.indexOf(selectedItem!);
                  });
                }
              ),
              Text("선택한 과목 : $selectedItem", style: TextStyle(fontSize: 50),),
              SizedBox(
                height: 300,
                width: 300,
                child : Image.asset(path[index], fit: BoxFit.cover,)
              )
            ],
          ),
        )
      )
    );
  }
}