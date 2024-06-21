import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/splash.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool done=true;
  load_Screen()
  {
    Future.delayed(const Duration(seconds: 5),(){
      setState(() {
        done=false;
      });
    });
  }

  @override
  void initState() {
    load_Screen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: done?const Splash():const HomeScreen(),
    );
  }
}
