import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:scale_button/scale_button.dart';
import 'package:flutter/widgets.dart';
import 'addhighscore.dart';
import 'about.dart';
import 'circle.dart';
import 'scorevalidator.dart';
import 'newgame.dart';
import 'highscore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MyApp> with TickerProviderStateMixin {
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
            child: Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
                  ScaleButton(
                    duration: Duration(microseconds: 5),
                    bound: 0.3,
                    reverse: true,
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Circle(),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(20)),
                  Text('WHACK-A-MOLE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text('EVERY TAP MATTERS',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff58d1ff),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(30)),
                  NewGame(),
                  Padding(padding: EdgeInsets.all(10)),
                  HighScores(),
                  Padding(padding: EdgeInsets.all(10)),
                  ScoreValidator(),
                  Padding(padding: EdgeInsets.all(10)),
                  About(),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewGamePage())
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Color(0xff58d1ff),
        splashColor: Color(0xff58d1ff),
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Color(0xff58d1ff)
            ),
            color: Colors.transparent,
          ),

          child: const Center(
            child: Text('NEW GAME', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackToMenu extends StatelessWidget {
  const BackToMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp())
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Color(0xff58d1ff),
        splashColor: Color(0xff58d1ff),
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Color(0xff58d1ff)
            ),
            color: Colors.transparent,
          ),

          child: const Center(
            child: Text('BACK TO MENU', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class HighScores extends StatelessWidget {
  const HighScores({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HighScoresPage())
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Colors.white
            ),
            color: Colors.transparent,
          ),
          child: const Center(
            child: Text('HIGH SCORES', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreValidator extends StatelessWidget {
  const ScoreValidator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScoreValidatorPage()),
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Colors.white
            ),
            color: Colors.transparent,
          ),
          child: const Center(
            child: Text('SCORE VALIDATOR', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Colors.white
            ),
            color: Colors.transparent,
          ),
          child: const Center(
            child: Text('ABOUT', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewHighScore extends StatelessWidget {
  const NewHighScore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHighScores()),//
          );
        },
        borderRadius: BorderRadius.circular(30),
        highlightColor: Colors.white,
        splashColor: Colors.white,
        child: Container(
          height: 50.0,
          width: 300,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                width: 2,
                color: Colors.greenAccent
            ),
            color: Colors.transparent,
          ),
          child: const Center(
            child: Text('ADD NEW HIGHSCORE', style: TextStyle(
              fontSize: 16,
              color: Colors.greenAccent,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

Color getMyColor(int i) {
  if( i % 2 == 0){
    return Color(0xff333333);
  }
  else{
    return Color(0xff444444);
  }
}

showAlertDialog(BuildContext context) {

  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HighScoresPage()),//
      );
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Validate score"),
    content: Text("Your score is validated."),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

