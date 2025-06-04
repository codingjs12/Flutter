import 'dart:core';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(JoinApp());
}

class JoinApp extends StatelessWidget {
  const JoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Join(),
    );
  }
}

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {

  TextEditingController idCtrl = TextEditingController();
  TextEditingController pwd1Ctrl = TextEditingController();
  TextEditingController pwd2Ctrl = TextEditingController();
  TextEditingController addrCtrl = TextEditingController();

  final List<String> hobbyList = ["코딩", "영화감상", "독서", "운동", "게임"];
  FirebaseFirestore fs = FirebaseFirestore.instance;
  List<String> selectList = [];

  var pass = false;

  var checkedFlg = false;

  void join() async {

    if(idCtrl.text == "" || pwd1Ctrl.text == "" || pwd2Ctrl.text == "" || addrCtrl.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("모든 값을 채우세요."))
      );
      return;
    }

    if(pwd1Ctrl.text != pwd2Ctrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("패스워드 확인하셈"))
      );
      return;
    }

    if(pass == false) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("아이디 중복검사를 하세요."))
      );
      return;
    }

    await fs.collection("userList").add({
      "userId" : idCtrl.text,
      "pwd" : pwd1Ctrl.text,
      "addr" : addrCtrl.text,
      "hobbyList" : selectList
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("회원가입 성공!!!"))
    );

    idCtrl.clear();
    pwd1Ctrl.clear();
    pwd2Ctrl.clear();
    addrCtrl.clear();

    setState(() {
      selectList = [];

    });
  }

  void idCheck() async {
    var checked = await fs.collection("userList")
        .where("userId", isEqualTo: idCtrl.text).get();

    if(checked.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("이미 있는 아이디!!!"))
      );
      pass = false;
    } else {
      setState(() {
        checkedFlg = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("사용 가능한 아이디!!!"))
      );
      pass = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("회원가입"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: idCtrl,
                    enabled: !checkedFlg,
                    decoration: InputDecoration(
                      hintText: "아이디"
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: idCheck,
                  child: Text("중복확인")
                ),
              ],
            ),
            TextField(
              controller: pwd1Ctrl,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "비밀번호"
              ),
            ),
            TextField(
              controller: pwd2Ctrl,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "비밀번호 확인"
              ),
            ),
            TextField(
              controller: addrCtrl,
              decoration: InputDecoration(
                hintText: "주소"
              ),
            ),
            SizedBox(height: 20,),
            Text("취미 선택", style: TextStyle(fontWeight: FontWeight.bold),),
            ...hobbyList.map((hobby) {
              return CheckboxListTile(
                title: Text(hobby),
                value: selectList.contains(hobby),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectList.add(hobby);
                    } else {
                      selectList.remove(hobby);
                    }
                  });
                }
              );
            }),
            ElevatedButton(
              onPressed: checkedFlg ? join : null,
              child: Text("회원가입")
            )
          ],
        ),
      ),
    );
  }
}