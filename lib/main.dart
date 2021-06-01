import 'package:flutter/material.dart';
import 'package:todomobx/screens/list_screen/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: ListScreen(),
    );
  }
}
