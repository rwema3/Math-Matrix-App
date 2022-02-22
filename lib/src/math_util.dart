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
