import 'package:flutter/material.dart';

void main() {
  runApp(const Review());
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title : Text(
            "타이틀",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        drawer: Drawer(

        ),
        body : Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Container(
              width: 200,
              color: Colors.red[600],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                print("뒤로가기 클릭!");
               }, icon: Icon(Icons.arrow_back_rounded)
              ),
              IconButton(onPressed: (){
                print("홈 클릭!");
               }, icon: Icon(Icons.home)
              ),
              IconButton(onPressed: (){
                print("로그아웃!");
               }, icon: Icon(Icons.logout)
              ),
            ],
          ),
        ),
      )
    );
  }
}
