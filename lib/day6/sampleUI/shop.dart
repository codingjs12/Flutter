import 'package:flutter/material.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {

  List<String> path = ["cheom.jpeg", "jeju2.jpg", "jeju3.jpg", "pohang.jpg", "seoul.jpg", "ulsan.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("쇼핑"),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.search)
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(path[index], height: 300,width: 300),
              Text("제품${index+1}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), ),
              Text("10000원", style: TextStyle(color: Colors.blue)),


            ],
          );
        },

      ),


    );
  }
}