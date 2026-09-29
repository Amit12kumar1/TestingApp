import 'package:flutter/material.dart';
import 'package:practice/screen/Introduction1.dart';
import 'package:practice/screen/Introduction2.dart';
import 'package:practice/screen/Introduction3.dart';


class OnBoard extends StatefulWidget {


  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  PageController pageController = PageController();
  String buttontext="skip";
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          PageView(
            controller: pageController,
            onPageChanged: (index){
              if(index==3){
                buttontext="done";
              }
              else{
                buttontext="skip";

              }
            },
            children: [
              Introduction1(),
              Introduction2(),
              Introduction3(),
            ],
          ),
          Container(
            alignment: Alignment(0,0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    pageController.nextPage(duration: Duration(milliseconds:500),curve: Curves.easeIn);
          },
            child: Text("next"),
          )

              ],

            )
          )
        ],

      ),
    );
  }
}