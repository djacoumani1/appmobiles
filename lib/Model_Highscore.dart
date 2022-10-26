class Highscores {
  final int? id;
  final String date;
  final String name;
  final String score;

   Highscores({
     this.id,
    required this.date,
    required this.name,
    required this.score,
  });

  factory Highscores.fromMap(Map<String, dynamic> json)=> new Highscores(
    id: json['id'],
    date: json['date'],
    name: json['name'],
    score: json['score'],
  );


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'name': name,
      'score': score,
    };
  }

  @override
  String toString() {
    return 'Highscores {id: $id,date: $date, name: $name, score: $score}';
  }
}