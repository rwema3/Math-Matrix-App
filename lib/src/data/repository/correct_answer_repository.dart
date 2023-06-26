import 'package:mathgame/src/data/models/correct_answer.dart';
import 'package:mathgame/src/utility/math_util.dart';

class CorrectAnswerRepository {
  static List<int> listHasCode = <int>[];

  static List<CorrectAnswer> getCorrectAnswerDataList(int level) {
    if (level == 1) {
      listHasCode.clear();
    }

    List<CorrectAnswer> list = [];

    while (list.length < 5) {
      MathUtil.generate(level, 5 - list.length).forEach((Expression expression) {
        List<int> x = [];
        int val;
        if (expression.operator2 == null) {
          val = (list.length % 2 == 0)
              ? int.parse(expression.firstOperand!)
              : int.parse(expression.secondOperand!);
          x.add(val);
        } else {
          val = (list.length % 3 == 0)
              ? int.parse(expression.firstOperand!)
              : (list.length % 3 == 1
              ? int.parse(expression.secondOperand!)
              : int.parse(expression.thirdOperand!));
          x.add(val);
        }
        while (x.length < 4) {
          int x4 = int.parse(MathUtil.generateRandomNumber(
              (val - 5) < 0 ? 1 : val - 5, val + 5, 1)
              .first);
          if (!x.contains(x4)) x.add(x4);
        }

        x.shuffle();
        CorrectAnswer correctAnswerQandS;
        if (expression.operator2 == null) {
          correctAnswerQandS = CorrectAnswer(
            "${((list.length % 2 == 0) ? "?" : expression.firstOperand)} ${expression.operator1} ${((list.length % 2 == 0) ? expression.secondOperand : "?")} = ${expression.answer}",
            x[0].toString(),
            x[1].toString(),
            x[2].toString(),
            x[3].toString(),
            (list.length % 2 == 0)
                ? int.parse(expression.firstOperand!)
                : int.parse(expression.secondOperand!),
          );
        } else {
          correctAnswerQandS = CorrectAnswer(
            "${((list.length % 3 == 0) ? "?" : expression.firstOperand)} ${expression.operator1} ${((list.length % 3 == 1) ? "?" : expression.secondOperand)} ${expression.operator2} ${((list.length % 3 == 2) ? "?" : expression.thirdOperand!)} = ${expression.answer}",
            x[0].toString(),
            x[1].toString(),
            x[2].toString(),
            x[3].toString(),
            (list.length % 3 == 0)
                ? int.parse(expression.firstOperand!)
                : (list.length % 3 == 1
                ? int.parse(expression.secondOperand!)
                : int.parse(expression.thirdOperand!)),
          );
        }
        if (!listHasCode.contains(correctAnswerQandS.hashCode)) {
          listHasCode.add(correctAnswerQandS.hashCode);
          list.add(correctAnswerQandS);
        }
      });
    }

    list.forEach((CorrectAnswer q) {
      print("${q.toString()}");
    });
    return list;
  }
}

void main() {
  for (int i = 1; i < 5; i++) {
    CorrectAnswerRepository.getCorrectAnswerDataList(i);
  }
}
