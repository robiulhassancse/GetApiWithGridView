import 'package:flutter/material.dart';
import 'package:simplegridview/Screen/photo_list_screen.dart';

void main(){
  runApp(const myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhotoListScreen(),
    );
  }
}
