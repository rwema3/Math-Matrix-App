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
    }
  }

  static bool isOperator(String sign) {
    return ["+", "-", "*", "/"].contains(sign);
  }

  // ignore: missing_return
  static int getPrecedence(String sign) {
    switch (sign) {
      case "+":
        return 1;
      case "-":
        return 1;
      case "*":
        return 2;
      case "/":
        return 3;
    }
  }

  static int generateRandomAnswer(int min, int max) {
    final _random = new Random();
    int result = min + _random.nextInt(max - min);
    return result;
  }

  static String generateRandomSign() {
    var x = ['/', '*', '-', '+'];
    final _random = new Random();
    int result = _random.nextInt(4);
    return x[result];
  }

  static List<String> generateRandomSign1(int count) {
    var listOfSign = <String>[];
    var list = [
      ['/', '*', '-', '+'],
      ['/', '*', '-', '+'],
      ['/', '*', '-', '+'],
      ['/', '*', '-', '+']
    ];

    while (listOfSign.length < count) {
      int row = Random().nextInt(4);
      int col = Random().nextInt(4);
      if (listOfSign.length == 0 || list[row][col] != listOfSign.last)
        listOfSign.add(list[row][col]);
    }
    return listOfSign;
  }

  static List<String> generateRandomNumber(int min, int max, int count) {
    var list = <List<int>>[];
    var listOfSign = <String>[];
    var listTemp = <int>[];

    for (int i = min; i <= max; i++) {
      listTemp.add(i);
    }
    for (int i = min; i <= max; i++) {
      list.add(listTemp);
    }
    while (listOfSign.length < count) {
      int row = Random().nextInt(max - min);
      int col = Random().nextInt(max - min);
      if (listOfSign.length == 0 ||
          list[row][col].toString() != listOfSign.last)
        listOfSign.add(list[row][col].toString());
    }
    return listOfSign;
  }

  static Expression getPlusSignExp(int min, int max) {
    var x = MathUtil.generateRandomNumber(min, max, 2);
    return Expression(
        firstOperand: x[0],
        operator1: "+",
        secondOperand: x[1],
        answer: int.tryParse(x[0]) + int.tryParse(x[1]));
  }

  static Expression getMinusSignExp(int min, int max) {
    var x1 = MathUtil.generateRandomNumber(max ~/ 2, max, 1);
    var x2 = MathUtil.generateRandomNumber(min, max, 1);
    while (int.tryParse(x2[0]) > int.tryParse(x1[0])) {
      x2 = MathUtil.generateRandomNumber(min, max, 1);
    }
    return Expression(
        firstOperand: x1[0],
        operator1: "-",
        secondOperand: x2[0],
        answer: int.tryParse(x1[0]) - int.tryParse(x2[0]));
  }

  static Expression getMultiplySignExp(int min, int max) {
    var x = MathUtil.generateRandomNumber(min, max, 2);

    return Expression(
        firstOperand: x[0],
        operator1: "*",
        secondOperand: x[1],
        answer: int.tryParse(x[0]) * int.tryParse(x[1]));
  }

  static Expression getDivideSignExp(int min, int max) {
    var listTemp = <Map<String, String>>[];
    for (int i = min; i <= max; i++) {
      for (int j = min; j <= max; j++) {
        if (i != 1 && j != 1 && j != i && j % i == 0) {
          listTemp.add({j.toString(): i.toString()});
        }
      }
    }
    listTemp.shuffle();
    if (listTemp.length > 0) {
      var x = listTemp[Random().nextInt(listTemp.length)];
      return Expression(
          firstOperand: x.keys.first,
          operator1: "/",
          secondOperand: x.values.first,
          answer: int.tryParse(x.keys.first) ~/ int.tryParse(x.values.first));
    } else {
      return null;
    }
  }

  static Expression getMixExp(int min, int max) {
    int operand = int.parse(MathUtil.generateRandomNumber(min, max, 1).first);
    var signList = MathUtil.generateRandomSign1(2);
    String firstSign = (MathUtil.getPrecedence(signList[0]) >=
            MathUtil.getPrecedence(signList[1]))
        ? signList[0]
        : "";
    String secondSign = (MathUtil.getPrecedence(signList[0]) >=
            MathUtil.getPrecedence(signList[1]))
        ? ""
        : signList[1];
    Expression expression;
    Expression finalExpression;

    switch (firstSign != "" ? firstSign : secondSign) {
      case "+":
        expression = MathUtil.getPlusSignExp(min, max);
        break;
      case "-":
        expression = MathUtil.getMinusSignExp(min, max);
 