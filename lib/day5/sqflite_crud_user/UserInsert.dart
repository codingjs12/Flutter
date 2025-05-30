import 'package:flutter/material.dart';
import 'package:flutter_ws/common/database.dart';
import 'UserList.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : UserInsert()
    );
  }
}

class UserInsert extends StatefulWidget {
  const UserInsert({super.key});

  @override
  State<UserInsert> createState() => _UserInsertState();
}

class _UserInsertState extends State<UserInsert> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("sqflite 실습"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserListApp(),
                  )
                );
              },
              icon : Icon(Icons.list)
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _nameCtrl,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextField(
                controller: _ageCtrl,
                decoration: InputDecoration(
                  labelText: "Age"
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async {
                String name = _nameCtrl.text;
                int age = int.tryParse(_ageCtrl.text) ?? 0;
                await DB.insertData(name, age);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("저장되었음.")
                  )
                );
                _nameCtrl.clear();
                _ageCtrl.clear();
              }, child: Text("사용자 추가"))
            ],
          ),
        ),
      );
  }
}

