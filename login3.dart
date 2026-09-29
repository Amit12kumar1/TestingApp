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
        body:Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                        color: Colors.deepOrange,
                    )
                    )
                  ),


                ),
              ],


            ),

          ),
        )


    );
  }
}