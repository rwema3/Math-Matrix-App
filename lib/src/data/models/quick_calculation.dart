class QuickCalculation {
  late String question;
  late String userAnswer;
  late int answer;

  QuickCalculation(this.question, this.answer) {
    userAnswer = "";
  }

  @override
  String toString() {
    return 'QuickCalculationQandS{question: $question, answer: $answer}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuickCalculation &&
              runtimeType == other.runtimeType &&
              question == other.question;

  @override
  int get hashCode => question.hashCode;
}
