import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchEx());
}

class SwitchEx extends StatefulWidget {
  const SwitchEx({super.key});

  @override
  State<SwitchEx> createState() => _SwitchExState();
}

class _SwitchExState extends State<SwitchEx> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Switch(
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            Text(isSwitched ? "껐다." : "켰다.")
          ],
        ),
      ),
    );
  }
}
