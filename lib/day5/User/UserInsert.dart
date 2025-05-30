import 'package:flutter/material.dart';
import 'UserList.dart';
import 'package:flutter_ws/common/database.dart';

void main() => runApp(UserInsertApp());

class UserInsertApp extends StatelessWidget {
  const UserInsertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserInsert();
  }
}

class UserInsert extends StatefulWidget {
  const UserInsert({super.key});

  @override
  State<UserInsert> createState() => _UserInsertState();
}

class _UserInsertState extends State<UserInsert> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserInsert"),
        centerTitle: true
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserListApp()
                )
              );
            },
            child: Icon(Icons.list)
          ),
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "이름을 입력하세요.",
              hintText: "재석"
            ),
          ),
          TextField(
            controller: ageCtrl,
            decoration: InputDecoration(
                labelText: "나이를 입력하세요.",
                hintText: "20"
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("추가되었습니다."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            nameCtrl.clear();
                            ageCtrl.clear();
                          },
                          child: Text("확인"),
                        ),
                      ],
                    );
                  }
                );
                await DB.insertData(nameCtrl.text, ageCtrl.text as int);
              },
              child: Text("사용자 추가")
            ),
          ),
        ],
      ),
    );
  }
}
