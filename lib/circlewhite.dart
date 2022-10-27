import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:flutter/widgets.dart';


class CircleWhite extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Container(
      height:60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
      ),

      child: Stack(
        children: [
          RippleAnimation(
              repeat: true,
              color: Colors.white,
              minRadius: 30,
              ripplesCount: 2,
              child: Container()
          ),
          Row(
            children:[
              Padding(padding: EdgeInsets.fromLTRB(23, 60, 0, 0)),
              Icon(Icons.circle, color:  Color(0xff0b1d31), size:15),
            ],),
        ],
      ),
    );
  }
}