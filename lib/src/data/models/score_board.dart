class ScoreBoard {
  late int highestScore;
  late int coin;
  late bool firstTime;

  ScoreBoard(this.highestScore);

  ScoreBoard.fromJson(Map<String, dynamic> json)
      : highestScore = json['highestScore'] as int? ?? 0,
        coin = json['coin'] as int? ?? 0,
        firstTime = json['firstTime'] as bool? ?? true;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['highestScore'] = highestScore;
    data['coin'] = coin;
    data['firstTime'] = firstTime;
    return data;
  }
}
