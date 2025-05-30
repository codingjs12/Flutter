import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImgApp(),
    );
  }
}

class ImgApp extends StatefulWidget {
  const ImgApp({super.key});

  @override
  State<ImgApp> createState() => _ImgAppState();
}

class _ImgAppState extends State<ImgApp> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImg() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // 이미지 선택 시 _image 변수에 저장
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> getCameraImg() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        // 이미지 선택 시 _image 변수에 저장
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이미지 선택"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Text("선택한 이미지 없음") : Image.file(
                _image!, width: 400, height: 400, fit: BoxFit.cover),
            ElevatedButton(
              onPressed: () {
                getImg();
              },
              child: Text("이미지 선택")
            ),
            ElevatedButton(
              onPressed: () {
                getCameraImg();
              },
              child: Text("카메라로 선택")
            ),
          ],
        ),
      ),
    );
  }
}

