// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home:HomeScreen() ,
    );
  }
}