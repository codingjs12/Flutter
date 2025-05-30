import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MemoEdit extends StatefulWidget {
  const MemoEdit({super.key});

  @override
  State<MemoEdit> createState() => _MemoEditState();
}

class _MemoEditState extends State<MemoEdit> {

  TextEditingController _userCtrl = TextEditingController();
  TextEditingController _txtCtrl = TextEditingController();

  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void addMemo() async {
    await fs.collection("memo").add({
      "user" : _userCtrl.text,
      "text" : _txtCtrl.text
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메모 작성"),),
      body: Column(
        children: [
          TextField(
            controller: _userCtrl,
            decoration: InputDecoration(
              labelText: "작성자"
            ),
          ),
          TextField(
            controller: _txtCtrl,
            decoration: InputDecoration(
                labelText: "내용"
            ),
          ),
          ElevatedButton(
            onPressed: addMemo,
            child: Text("저장")
          )
        ],
      ),
    );
  }
}
