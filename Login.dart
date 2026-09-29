      import 'package:flutter/material.dart';
      //How to take user input / Login&Signup



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
              primarySwatch: Colors.green,
            ),
            home: Dashboard(),
          );
        }

      }

      class Dashboard extends StatelessWidget{
        var emailText=TextEditingController();
        var passText = TextEditingController();
        @override
        Widget build(BuildContext context){
          return Scaffold(
              appBar: AppBar(

                backgroundColor: Colors.indigo,
                title: Text("login page",
                  style: TextStyle(fontSize: 30,
                      color: Colors.yellow,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Center(
                child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailText,
                        decoration: InputDecoration(
                          hintText: 'Enter email here...',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2,
                              )
                          ),

                          enabledBorder:  OutlineInputBorder(

                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2,
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2,
                              )
                          ),
                          suffixText: 'User exits',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye,color: Colors.deepOrange,),
                            onPressed: (){

                            },

                          ),
                          prefixIcon: Icon(Icons.email,color: Colors.deepOrange,),
                        ),

                      ),
                      SizedBox(height: 11,),
                      TextField(
                        controller: passText,
                        obscureText: true,
                        obscuringCharacter: '*',

                        decoration: InputDecoration(
                            hintText: 'Password..',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(

                                  color: Colors.deepOrange,
                                )
                            )

                        ),

                      ),
                      ElevatedButton(onPressed: (){
                        String uEmail=emailText.text.toString();
                        String uPass= passText.text;
                        print("Email: $uEmail , Pass:$uPass");
                      },
                          child: Text('Login')
                      ),
                    ],
                  ),

                ),
              )
          );
        }
      }