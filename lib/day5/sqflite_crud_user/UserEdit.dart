import 'package:flutter/material.dart';
import '../../common/database.dart';

class UserEditApp extends StatefulWidget {
  int id;
  UserEditApp({super.key, required this.id});

  @override
  State<UserEditApp> createState() => _UserEditAppState();
}

class _UserEditAppState extends State<UserEditApp> {

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  Future<void> _loadUser() async {
    var user = await DB.loadUser(widget.id);
    var userInfo = user.first;
    setState(() {
      nameCtrl.text = userInfo["NAME"];
      ageCtrl.text = userInfo["AGE"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 수정"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: ageCtrl,
              decoration: InputDecoration(
                  labelText: "Age"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () async {
              String name = nameCtrl.text;
              int age = int.tryParse(ageCtrl.text) ?? 0;
              await DB.updateData(
                  widget.id, name, age);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("저장되었음.")
                  )
              );
            }, child: Text("수정"))
          ],
        ),
      ),
    );
  }
}
