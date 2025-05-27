import 'package:flutter/material.dart';

void main() => runApp(CheckBoxEx());

class CheckBoxEx extends StatefulWidget {
  const CheckBoxEx({super.key});

  @override
  State<CheckBoxEx> createState() => _CheckBoxExState();
}

class _CheckBoxExState extends State<CheckBoxEx> {

  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child : Row(
                children: [
                  Text("자바"),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }
                  ),
                  Text("플러터"),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }
                  ),
                  Text("오라클"),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
