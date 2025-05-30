import 'package:flutter/material.dart';


void main() => runApp(UserEditApp());

class UserEditApp extends StatelessWidget {
  const UserEditApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserEdit();
  }
}

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UserEdit"),),
    );
  }
}

