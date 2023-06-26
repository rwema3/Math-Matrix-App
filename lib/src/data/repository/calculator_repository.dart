import 'package:mathgame/src/data/models/calculator.dart';
import 'package:mathgame/src/utility/math_util.dart';

class CalculatorRepository {
  static List<int> listHasCode = <int>[];

  static List<Calculator> getCalculatorDataList(int level) {
    if (level == 1) {
      listHasCode.clear();
    }

    List<Calculator> list = [];

    while (list.length < 5) {
      MathUtil.generate(level, 5 - list.length).forEach((Expression expression) {
        Calculator calculatorQandS;
        if (expression.operator2 == null) {
          calculatorQandS = Calculator(
            "${expression.firstOperand} ${expression.operator1} ${expression.secondOperand}",
            expression.answer,
          );
        } else {
          calculatorQandS = Calculator(
            "${expression.firstOperand} ${expression.operator1} ${expression.secondOperand} ${expression.operator2} ${expression.thirdOperand}",
            expression.answer,
          );
        }
        if (!listHasCode.contains(calculatorQandS.hashCode)) {
          listHasCode.add(calculatorQandS.hashCode);
          list.add(calculatorQandS);
        }
      });
    }

    list.forEach((Calculator q) {
      print("${q.toString()}");
    });
    return list;
  }
}

void main() {
  for (int i = 1; i <= 7; i++) {
    CalculatorRepository.getCalculatorDataList(i);
    print("**************");
  }
}
