import 'package:flutter/material.dart';

void main() => runApp(UserListApp());

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserListPage();
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}


