import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter/widgets.dart';
import 'Model_Highscore.dart';
import 'highscoresDB.dart';
import 'package:flutter/services.dart';
import 'highscore.dart';
import 'main.dart';

class AddHighScores extends StatefulWidget {
  @override
  AddHighScoresState createState() => AddHighScoresState();
}

class AddHighScoresState  extends State<AddHighScores>{
  final date = TextEditingController();
  final name = TextEditingController();
  final score = TextEditingController();
  bool _validateDate = false;
  bool _validateName = false;
  bool _validateScore = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HighScoresPage()),//
                        );
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
                                          child: TextField(
                                            controller: date,
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration: InputDecoration(
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
                                              errorText: _validateDate ? 'Date can\'t be empty' : null,
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
                                          child: TextField(
                                            controller: name,
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration:  InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Color(0xff58d1ff),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff58d1ff)),
                                              ),
                                              errorText: _validateName ? 'Name can\'t be empty' : null,
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
                                          child: TextField(
                                            controller: score,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                              color: Color(0xff58d1ff),
                                            ),
                                            decoration:  InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0.5,
                                                  color: Color(0xff58d1ff),
                                                ),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff58d1ff)),
                                              ),
                                              errorText: _validateScore ? 'Score can\'t be empty' : null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                      child: FloatingActionButton.extended(
                                        icon: Icon(Icons.save,),
                                        backgroundColor: Color(0xff58d1ff),
                                        onPressed: () async{
                                          if(!date.text.isEmpty && !name.text.isEmpty && !score.text.isEmpty){
                                            await HighscoresDB.instance.insert(Highscores(date: date.text, name: name.text, score: score.text));
                                            showAlertDialog(context);
                                          }
                                          setState(() {
                                            if(date.text.isEmpty){
                                              date.text.isEmpty ? _validateDate = true : _validateDate = false;
                                            }
                                            if(name.text.isEmpty){
                                              name.text.isEmpty ? _validateName = true : _validateName = false;
                                            }
                                            if(score.text.isEmpty){
                                              score.text.isEmpty ? _validateScore = true : _validateScore = false;
                                            }
                                            date.clear();
                                            name.clear();
                                            score.clear();

                                          });
                                        }, label: Text("ADD HIGHSCORE"), ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(22)),
                            Divider(
                              height: 1,
                              thickness: 0.3,
                              color: Colors.white,
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