import 'package:flutter/material.dart';
import 'UserEdit.dart';
import '../../common/database.dart';

class UserListApp extends StatefulWidget {
  const UserListApp({super.key});

  @override
  State<UserListApp> createState() => _UserListAppState();
}

class _UserListAppState extends State<UserListApp> {

  List<Map<String, dynamic>> list = [];

  Future<void> _selectUser() async {
    var userList = await DB.getData();
    setState(() {
      list = userList;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("사용자"),),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var user = list[index];
          return ListTile(
            title: Text(
              "아이디 : ${user["ID"]}, 이름 : ${user["NAME"]}",
              style: TextStyle(
                fontSize: 10
              ),
            ),
            subtitle: Text("나이 : ${user["AGE"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    bool flg =
                    await Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => UserEditApp(id: user["ID"])
                      )
                    );
                    if(flg) {
                      _selectUser();
                    }
                  },
                  icon: Icon(Icons.edit)),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("삭제"),
                          content: Text(
                            "${user["NAME"]}님을 정말 삭제 하실거?"
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                DB.deleteData(user["ID"]);
                                Navigator.of(context).pop();
                                _selectUser();
                              },
                              child: Text("삭제"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("취소"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
