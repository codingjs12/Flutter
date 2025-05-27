import 'package:flutter/material.dart';

void main() {
  runApp(const RadioEx());
}

class RadioEx extends StatefulWidget {
  const RadioEx({super.key});

  @override
  State<RadioEx> createState() => _RadioExState();
}

class _RadioExState extends State<RadioEx> {

  String selectItem = "Java";



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: Radio(
                value: "Java",
                groupValue: selectItem,
                onChanged: (value) {
                  setState(() {
                    selectItem = value!;
                  });
                }
              ),
              title : Text("자바")
            ),
            ListTile(
                leading: Radio(
                    value: "Oracle",
                    groupValue: selectItem,
                    onChanged: (value) {
                      setState(() {
                        selectItem = value!;
                      });
                    }
                ),
                title : Text("오라클")
            ),
            ListTile(
                leading: Radio(
                    value: "Flutter",
                    groupValue: selectItem,
                    onChanged: (value) {
                      setState(() {
                        selectItem = value!;
                      });
                    }
                ),
                title : Text("플러터")
            ),
          ],
        ),
      ),
    );
  }
}

