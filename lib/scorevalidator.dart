import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter/widgets.dart';
import 'validate.dart';


class ScoreValidatorPage extends StatelessWidget {
  const ScoreValidatorPage({super.key});

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
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(30)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(-1.4, 1),
                          ),
                          Image.asset('assets/backIcon.png', width: 60, height: 60,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 52, 0, 0),
                            child: Text('BACK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff58d1ff),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            Image.asset('assets/validate.png', width: 100, height: 100,),
                            Padding(padding: EdgeInsets.all(2)),
                            Text('SCORE VALIDATOR',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Divider(
                              height: 1,
                              thickness: 0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                width: 230,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('DATE: ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration: const InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Color(0xff58d1ff),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff58d1ff)),
                                              ),
                                              hintText: "     DD/MM/YYYY",
                                              hintStyle: TextStyle(
                                                color: Color(0xff58d1ff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('NAME:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration: const InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Color(0xff58d1ff),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff58d1ff)),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('SCORE:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration: const InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Color(0xff58d1ff),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff58d1ff)),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(20)),
                                    Validate()
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(20)),
                            Divider(
                              height: 1,
                              thickness: 0.6,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text('Score exist : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}