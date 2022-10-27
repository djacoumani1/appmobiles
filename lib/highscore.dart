import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter/widgets.dart';
import 'Model_Highscore.dart';
import 'highscoresDB.dart';
import 'main.dart';

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
                        padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                        child: Text('HIGHSCORES', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 50, 0, 0),
                        child: SizedBox(
                            width: 380,
                            height: 330,
                            child: HighScoresView()),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 400, 0, 0),
                        child: NewHighScore(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 465, 0, 0),
                        child: BackToMenu(),
                      ),

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Flexible(
            child: FutureBuilder<List<Highscores>>(
                future: HighscoresDB.instance.allHighscores(),
                builder: (BuildContext context, AsyncSnapshot<List<Highscores>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center( child: CircularProgressIndicator());
                  }
                  return snapshot.data!.isEmpty
                      ? Center(child: Text("There is no data at this time. Please add more.", style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)):
                  AnimatedList(
                      key: key,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      initialItemCount: snapshot.data!.length,
                      itemBuilder: (context, index, animation) {
                        Highscores high = snapshot.data![index];
                        return SizeTransition(
                          key: UniqueKey(),
                          sizeFactor: _animation,
                          child: Column(
                            children: [
                              Dismissible(
                                //direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Icon(Icons.delete),
                                ),
                                secondaryBackground: Container(
                                  color: Colors.lightBlue,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Icon(Icons.edit),
                                ),
                                key: ValueKey<int>(snapshot.data![index].id!),
                                onDismissed: (direction) async {
                                  if (direction == DismissDirection.startToEnd){
                                    await HighscoresDB.instance.delete(snapshot.data![index].id!);
                                    snapshot.data!.remove(snapshot.data![index]);
                                    setState(() {});
                                  }
                                  else if (direction == DismissDirection.endToStart){
                                    await HighscoresDB.instance.update(Highscores(id:snapshot.data![index].id! ,date: "19-10-2022", name: "Souleymane", score: "99"));
                                    setState(() {});
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HighScoresPage()),//
                                  );
                                },
                                child: Card(
                                  elevation: 14,
                                  margin: EdgeInsets.all(1.5),
                                  child: ListTile(
                                    hoverColor: Color(0xff58d1ff),
                                    selectedTileColor: Color(0xff58d1ff),
                                    onTap: () {
                                    },
                                    title: Text(high.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        )
                                    ),
                                    leading: Text(high.date,
                                        style: TextStyle(
                                          color: Colors.white,
                                        )
                                    ),
                                    trailing: Text(high.score.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  color: getMyColor(index),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  );

                }
            ),
          ),
        ],
      ),

    );
  }
}
