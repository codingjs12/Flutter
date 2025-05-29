import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: ToDoListEx(),
      ),
    );
  }
}

class ToDoListEx extends StatefulWidget {
  const ToDoListEx({super.key});

  @override
  State<ToDoListEx> createState() => _ToDoListExState();
}

class _ToDoListExState extends State<ToDoListEx> {

  TextEditingController txtCtrl = TextEditingController();

  List<Map<String, Object>> list = [];

  void addToDo() {
    String title = txtCtrl.text;
    setState(() {
      list.add({
        "title" : title, "isDone" : false
      });
      txtCtrl.clear();
    });
  }

  void deleteToDo(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("삭제"),
        content : Text("정말 삭제 하실?"),
        actions : [
          TextButton(onPressed: (){
            setState(() {
              list.removeAt(index);
            });
            Navigator.of(context).pop();
          }, child: Text("삭제")),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("취소"),)
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "할 일"
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: txtCtrl,
                  decoration: InputDecoration(
                    hintText: "할 일 입력 하쇼"
                  ),
                )
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                onPressed: addToDo,
                child: Text("추가"),
              )
            ],
          ),
          Expanded(
            child: list.isEmpty ? Center(child: Text("할일 없음"),)
              : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Map itemMap = list[index];
                  return ListTile(
                    title: Text(
                      itemMap["title"],
                      style: TextStyle(
                        decoration: itemMap["isDone"] ? TextDecoration.lineThrough : null
                      ),
                    ),
                    leading: Checkbox(
                      value: itemMap["isDone"],
                      onChanged: (value) {
                        setState(() {
                          itemMap["isDone"] = value;
                        });
                      }
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteToDo(index),
                      icon: Icon(Icons.delete)
                    ),
                  );
                },
              )
          )
        ],
      ),
    );
  }
}