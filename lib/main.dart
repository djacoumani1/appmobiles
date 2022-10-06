import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:scale_button/scale_button.dart';

void main() => runApp(MyApp());

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

class HighScoresPage extends StatelessWidget{
   const HighScoresPage({Key? key}) : super(key: key);
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
              child:Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(120, 40, 0, 0),
                      child: Text('HIGHSCORES', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 90, 0, 0),
                      child: SizedBox(
                        width: 380,
                          height: 310,
                          child: HighScoresView()),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 420, 0, 0),
                      child: BackToMenu(),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      ),

    );
  }
}

class HighScoresView extends StatefulWidget {
  @override
  HighScoresViewState createState() => HighScoresViewState();
}

class HighScoresViewState extends State<HighScoresView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  final key = GlobalKey<HighScoresViewState>();
  List<String> date = <String>['28/09/2022 18:32:36', '28/09/2022 18:32:36', '28/09/2022 18:32:36', '28/09/2022 18:32:36', '28/09/2022 18:32:36','28/09/2022 18:32:36','28/09/2022 18:32:36','28/09/2022 18:32:36','28/09/2022 18:32:36','28/09/2022 18:32:36','28/09/2022 18:32:36'];
  List<String> nom = <String>['PLAYER1', 'PLAYER1', 'PLAYER1', 'PLAYER1', 'PLAYER1','PLAYER1', 'PLAYER1', 'PLAYER1', 'PLAYER1', 'PLAYER1','PLAYER1'];
  List<String> score = <String>['100','99','98','97','96','95','94','93','92','91','90'];
 Color couleur= Colors.transparent;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<bool> _selected = List.generate(date.length, (i) => false);
    return AnimatedList(
      key: key,
        initialItemCount: date.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            key: UniqueKey(),
              sizeFactor: _animation,
            child: Card(
              elevation: 14,
              margin: EdgeInsets.all(1.5),
                    child: ListTile(
                      hoverColor: Color(0xff58d1ff),
                      selectedTileColor: Color(0xff58d1ff),
                      onTap: () {
                      },
                      title: Text(nom[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.white,
                      )
                      ),
                      leading: Text(date[index],
                          style: TextStyle(
                            color: Colors.white,
                          )
                      ),
                      trailing: Text(score[index],
                          style: TextStyle(
                            color: Colors.white,
                          )),
                  ),
                    color: getMyColor(index),
            ),
          );
        });
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