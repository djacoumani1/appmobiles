import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter/widgets.dart';
import 'circle.dart';


class NewGamePage extends StatelessWidget{
  const NewGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff0b1d31),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                repeat: ImageRepeat.repeat,
                image: Svg(
                    'assets/backgroundPattern.svg',
                    size: Size(40, 40),
                    color: Color(0xff0a243b)
                ),
              ),
            ),
            child: Container(
              child: Center(
                child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                        child: Circle(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                        child: Image(
                          width: 40,
                          height: 40,
                          image: Svg('assets/tapsIcon.svg'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: Text('TAP THE CIRCLE TO START',textAlign: TextAlign.center  ,style: TextStyle(
                          fontSize: 18,

                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}