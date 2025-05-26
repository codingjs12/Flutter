import 'package:flutter/material.dart';

void main() {
  runApp(const FlexEx1());
}

class FlexEx1 extends StatelessWidget {
  const FlexEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(),
        body: Row(
          children: [
            Flexible(
              child: Container(
                color: Colors.green,
              ),
              flex: 1,
            ),
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child : Container(
                      color: Colors.red
                    ),
                  ),
                  Flexible(
                    child : Container(
                      color: Colors.blue[900]
                    ),
                  ),
                  Flexible(
                    child : Container(
                      color: Colors.green
                    ),
                  ),
                ],
              ),
              flex: 2,
            ),
            Flexible(
              child: Container(
                color: Colors.red,
              ),
              flex: 1,
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
        ),
      )
    );

  }
}