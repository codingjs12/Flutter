import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: TodoList(),
      ),

    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  TextEditingController _txtCtrl = TextEditingController();
  String todo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("할 일 목록"),
        )
      ),
      body: Column(
        children:[
          Row(children: [
            Expanded(
              child: TextField(
                controller: _txtCtrl,
                decoration: InputDecoration(
                  labelText: "할일을 입력 하세요.",
                  hintText: "빨래",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100]
                ),
              )
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  todo = _txtCtrl.text;
                });
              },
              child: Text("추가"))
          ]),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(todo)
                  ],
                )
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("삭제 알림"),
                            content: Text("삭제 하실?"),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("삭제"),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("취소"),
                              ),
                            ],
                          );
                        }
                    ),
                    child: Text("삭제!!!")
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
