import 'package:flutter/material.dart';

void main() {
  runApp(const Test1());
}

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title : Text(
            "제품 목록",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        drawer: Drawer(

        ),
        body : ListView(
          children: [
            ListTile(
              leading: Image.asset("dog.png", width: 60, height: 60, fit: BoxFit.cover,),
              title : Text("강아지", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("몰티즈"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Image.asset("cheom.jpeg", width: 60, height: 60, fit: BoxFit.cover,),
              title : Text("경주", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("첨성대"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Image.asset("pohang.jpg", width: 60, height: 60, fit: BoxFit.cover),
              title : Text("포항", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("손"),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Image.asset("ulsan.jpg", width: 60, height: 60, fit: BoxFit.cover),
              title : Text("울산", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("간절곶"),
              onTap: (){},
            ),
            Divider(),
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
