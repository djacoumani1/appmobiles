import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';
import 'package:flutter/widgets.dart';
import 'highscore.dart';

class Validate extends StatelessWidget {
  const Validate({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      reverse: true,
      bound: 0.1,
      duration: Duration(microseconds: 5),
      child: InkWell(
        onTap: () {
          showAlertDialog(context);
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
            child: Text('VALIDATE SCORE', style: TextStyle(
              fontWeight: FontWeight.bold,
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