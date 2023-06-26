class MentalArithmetic {
  late String currentQuestion;
  late List<String> questionList;
  late int answer;
  late int answerLength;

  MentalArithmetic(this.questionList, this.answer) {
    this.currentQuestion = questionList[0];
    this.answerLength = answer.toString().trim().length;
  }

  @override
  String toString() {
    return 'CalculatorQandS{question: $questionList, answer: $answer}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MentalArithmetic &&
              runtimeType == other.runtimeType &&
              questionList == other.questionList;

  @override
  int get hashCode => questionList.hashCode;
}
