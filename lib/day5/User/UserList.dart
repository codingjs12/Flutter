import 'package:flutter/material.dart';
import '../../common/database.dart';


void main() => runApp(UserListApp());

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserList();
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});




  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> item = [];
  Future<void> _fetchData() async {
    List<Map<String, dynamic>> data = await DB.getData();
    setState(() {
      item = data;  // 조회한 데이터를 리스트에 저장
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();  // 데이터 조회 함수 호출
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sqflite 실습"),),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          Map map = item[index];
          return Card(
            child: Column(
              children: [
                Text("이름 $map"),
                Text("나이 $map")

              ],
            ),
          );
        }
      )
    );
  }
}
