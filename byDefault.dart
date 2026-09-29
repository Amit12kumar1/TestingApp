import 'package:flutter/material.dart';
import 'package:practice/Coding%20Age%20Project/main.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: Center(
          child: Text('wellcome to flutter'),
        ),
      ),
    );
  }
}