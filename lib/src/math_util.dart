import 'dart:math';

class MathUtil {
  // ignore: missing_return
  static int evaluate(int x1, String sign, int x3) {
    switch (sign) {
      case "+":
        return x1 + x3;
      case "-":
        return x1 - x3;
      case "*":
        return x1 * x3;
      case "/":
        return x1 ~/ x3;

            case "*":
              expression = MathUtil.getMixExp(1, 15);
              break;
            case "/":
              expression = MathUtil.getDivideSignExp(min, max);
              break;
          }
        } else if (level < 5) {
          expression = MathUtil.getMixExp(1, 25);
        } else if (level < 6) {
          expression = MathUtil.getMixExp(1, 30);
        } else {
          expression = MathUtil.getMixExp(1, 50);
        }
        if (expression != null && !list.contains(expression)) {
          list.add(expression);
        }
      });
    }
    list.forEach((Expression q) {
//      print("${q.toString()}");
    });
    return list;
  }
}

void main() {
  for (int i = 1; i < 15; i++) {
//    MathUtil.getMixExp(1, 10);
    print("******$i*********");
    print("${MathUtil.getMentalExp(1)}");
//  print("${MathUtil.generateRandomSign1(5)}");
  }
}

class Expression {
  String firstOperand;
  String operator1;
  String secondOperand;
  String operator2;
  String thirdOperand;
  int answer;

  Expression(
      {this.firstOperand,
      this.operator1,
      this.secondOperand,
      this.operator2,
      this.thirdOperand,
      this.answer});

  @override
  String toString() {
    return 'Expression{firstOperand: $firstOperand, operator1: $operator1, secondOperand: $secondOperand, operator2: $operator2, thirdOperand: $thirdOperand, answer: $answer}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Expression &&
          runtimeType == other.runtimeType &&
          firstOperand == other.firstOperand &&
          operator1 == other.operator1 &&
          secondOperand == other.secondOperand &&
          operator2 == other.operator2 &&
          thirdOperand == other.thirdOperand &&
          answer == other.answer;

  @override
  int get hashCode =>
      firstOperand.hashCode ^
      operator1.hashCode ^
      secondOperand.hashCode ^
      operator2.hashCode ^
      thirdOperand.hashCode ^
      answer.hashCode;
}
