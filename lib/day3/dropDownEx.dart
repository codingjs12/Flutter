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
  
  Map<String, String> map = {
    "JAVA" : "dog.png",
    "ORACLE" : "fox.jpg",
    "HTML/CSS" : "fox2.jpg",
    "Flutter" : "hana.jpg"
  };

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
                  });
                }
              ),
              Text("선택한 과목 : $selectedItem", style: TextStyle(fontSize: 50),),
              Container(height: 10,),
              Image.asset(map[selectedItem]!)
            ],
          ),
        )
      )
    );
  }
}