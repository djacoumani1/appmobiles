import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:scale_button/scale_button.dart';
import 'package:flutter/widgets.dart';
import 'circlewhite.dart';


class AboutPage extends StatelessWidget {

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
                    width: 300,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(130)),
                        Divider(
                          height: 1,
                          thickness: 0,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text('ABOUT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula ac enim sed interdum. Etiam at malesuada ligula. Sed sodales in sem id cursus. Etiam hendrerit purus nunc. Nunc ultrices tempor dictum. Nam egestas sapien arcu, a mollis nisi mattis ac. Suspendisse potenti. Pellentesque accumsan convallis dolor, quis iaculis libero posuere sit amet.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,

                          ),
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        ScaleButton(
                          reverse: true,
                          duration: Duration(microseconds: 5),
                          bound: 0.5,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },

                            child: Stack(
                              alignment: Alignment.center,
                              textDirection: TextDirection.rtl,
                              fit: StackFit.loose,
                              clipBehavior: Clip.hardEdge,

                              children: [
                                CircleWhite(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}