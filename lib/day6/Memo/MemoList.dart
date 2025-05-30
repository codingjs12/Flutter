import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ws/day6/Memo/MemoEdit.dart';


class MemoList extends StatefulWidget {
  const MemoList({super.key});

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {

  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void removeItem(String id) async {
    await fs.collection("memo").doc(id).delete();
  }

  void editItem(String id, String currentText) async {
    TextEditingController _editTextCtrl = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("수정"),
          content: TextField(
            controller: _editTextCtrl,
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  await fs.collection("memo").doc(id).update({
                    "text" : _editTextCtrl.text
                  });
                },
                child: Text("수정")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("취소")
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메모장 목록"),),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                stream: fs.collection("memo").orderBy("user").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      return ListTile(
                        title: Text(doc["user"]),
                        subtitle: Text(doc["text"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => editItem(
                                    doc.id, doc["text"]
                                ),
                                icon : Icon(Icons.edit)
                            ),
                            IconButton(
                                onPressed: () => removeItem(
                                    doc.id
                                ),
                                icon : Icon(Icons.delete)
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoEdit(),
            )
          );
        },
        child:Icon(Icons.add)
      )
    );
  }
}
