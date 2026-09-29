// Card Widget
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(flutterApp());
// }
//
// class flutterApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "FlutterApp",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       home: Dashboard(),
//     );
//   }
//
// }
//
// class Dashboard extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     var arrNames =['manjeet','ujjwal','priya','anshal','ramesh','ranju','Pallavi'];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: Text("Dashboard",
//           style: TextStyle(fontSize: 30,
//               color: Colors.yellow,
//               fontStyle: FontStyle.italic,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: Card(
//           shadowColor: Colors.indigo.shade900,
//           elevation: 20,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Anshal',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
//           ),
//         ),
//       ),
//     );
//   }
// }