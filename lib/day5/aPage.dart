import 'package:flutter/material.dart';
import 'bPage.dart';

void main() => runApp(APage());

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {

  String? _result = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A 페이지"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result =
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BPage(
                    ),
                  )
                );
                setState(() {
                  _result = result ?? "값이 없어";
                });
              },
              child: Text("되돌려받는 버튼")
            ),
            Text("$_result << 되돌려받은값")
          ],
        ),
      ),
    );
  }
}
