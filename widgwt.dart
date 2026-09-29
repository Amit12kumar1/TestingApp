
//Expanded Widget
import 'package:flutter/material.dart';



void main(){
  runApp(flutterApp());
}

class flutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Dashboard(),
    );
  }

}

class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Dashboard",
            style: TextStyle(fontSize: 30,
                color: Colors.yellow,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,

                color: Colors.greenAccent.shade200,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 100,

                color: Colors.deepPurple,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,

                color: Colors.amber,
              ),
            ),
            Expanded(
              child: Container(
                height: 100,

                color: Colors.teal,
              ),
            ),
          ],
        )
    );
  }
}