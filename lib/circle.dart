import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Container(
      height:100,
      width: 100,
      decoration: BoxDecoration(
          color:Color(0xff58d1ff),
          borderRadius: BorderRadius.circular(100)
      ),

      child: Stack(
        children: [
          RippleAnimation(
              repeat: true,
              color: Color(0xff58d1ff),
              minRadius: 50,
              ripplesCount: 2,
              child: Container()
          ),
          Row(
            children:[
              Padding(padding: EdgeInsets.fromLTRB(41, 100, 0, 0)),
              Icon(Icons.circle, color:  Color(0xff0b1d31), size:20),
            ],),
        ],
      ),
    );
  }
}