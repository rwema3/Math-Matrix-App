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
