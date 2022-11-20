// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tokoto/screens/login.dart';


class Welcome  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 120,),
          Container(
            width: 230,
            height: 230,
            child: Image(
              image: AssetImage('assets/images/g.jpg'),
            ),
          ),
          SizedBox(height: 25,),
          // ignore: prefer_const_constructors
          Text("GetInTouch",
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontSize: 33
            ),
          ),
          SizedBox(height: 170,),
          Container(
            height: 47,
            width: 260,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
              },
              child:Text("Continue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor:Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
          ),
          SizedBox(height: 70,),
          Text("Designed by ANANTHU T J"
          ,style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),),
          
        ],
      ),
    );
  }
}