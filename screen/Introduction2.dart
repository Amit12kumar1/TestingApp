import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Introduction2 extends StatelessWidget {
  const Introduction2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/baba.jpg"),
        SizedBox(height: 40,),
        Text("Har Har Mahadev",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,),
        Text("Har har bhole,Har har bhole,Har har bhole,Har har bhole,Har har bhole,Har har bhole",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.6)
          ),
          textAlign: TextAlign.center,
        )

      ],
    );
  }
}