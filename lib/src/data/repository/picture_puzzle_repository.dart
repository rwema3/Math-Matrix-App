import 'package:mathgame/src/data/models/picture_puzzle.dart';
import 'package:mathgame/src/utility/math_util.dart';

class PicturePuzzleRepository {
  static List<int> listHasCode = List();

  static getPicturePuzzleDataList(int level) {
    if (level == 1) {
      listHasCode.clear();
    }

    List<PicturePuzzle> list = List();
    
    while (list.length < 5) {
      List<PicturePuzzleShapeList> puzzleList = List();
      List<PicturePuzzleData> picturePuzzleDataList =
          getNewShapeMatrix(level, list.length);
      print("\n");

      picturePuzzleDataList
          .asMap()
          .forEach((int i, PicturePuzzleData picturePuzzleData) {
        puzzleList.add(PicturePuzzleShapeList([
          PicturePuzzleShape(
              isSign: false,
              picturePuzzleShapeType: picturePuzzleData.picturePuzzleShapeType1,
              text: ""),
          PicturePuzzleShape(
              isSign: true, isAnswer: false, text: picturePuzzleData.sign1),
          PicturePuzzleShape(
              isSign: false,
              picturePuzzleShapeType: picturePuzzleData.picturePuzzleShapeType2,
              text: ""),
          PicturePuzzleShape(
              isSign: true, isAnswer: false, text: picturePuzzleData.sign2),
          PicturePuzzleShape(
              isSign: false,
              picturePuzzleShapeType: picturePuzzleData.picturePuzzleShapeType3,
              text: ""),
          PicturePuzzleShape(isSign: true, isAnswer: false, text: "="),
          PicturePuzzleShape(
              isSign: true,
              isAnswer: true,
              text: i == picturePuzzleDataList.length - 1
                  ? "?"
                  : picturePuzzleData.text)
        ]));
      });

      list.add(PicturePuzzle(
          puzzleList, int.parse(picturePuzzleDataList.last.text)));
    }

    list.forEach((list1) {
      list1.list.forEach((list) {
        print(
            "${list.shapeList[0].picturePuzzleShapeType} ${list.shapeList[2].picturePuzzleShapeType} ${list.shapeList[4].picturePuzzleShapeType} ${list1.answer}");
      });
    });
    print("\n");
    return list;
  }

  static List<PicturePuzzleData> getNewShapeMatrix(int level, int index) {
    List<PicturePuzzleData> list = List();
    List<String> listDigit = List();
    List<String> listSign = List();
    List<PicturePuzzleShapeType> listShape = [
      PicturePuzzleShapeType.CIRCLE,
      PicturePuzzleShapeType.TRIANGLE,
      PicturePuzzleShapeType.SQUARE
    ]..shuffle();
    if (level == 1) {
      switch (index) {
        case 0:
        case 1:
          listSign = ["+", "+", "+"];
          while (listDigit.length < 3) {
            MathUtil.generateRandomNumber(1, 10, 3).forEach((digit) {
              if (!listDigit.contains(digit)) {
                listDigit.add(digit);
              }
            });
          }
          list.add(getRowFirst(
              listShape[0], listSign[0], listSign[1], listDigit[0]));
          list.add(getRowSecond(listShape[0], listSign[0], listShape[1],
              listSign[0], listDigit[0], listDigit[1], listDigit[2]));
          list.add(getRowThird(listSign[0], listShape[1], listSign[2],
              listShape[2], listDigit[0], listDigit[1], listDigit[2]));
          list.add(getRowLast(
              listShape[0],
              listSign[0],
              listShape[1],
              listSign[1],
              listShape[2],
              listDigit[0],
              listDigit[1],
              listDigit[2]));
          break;
        case 2:
        case 3:
        case 4:
          listSign = ["+", "-", "*"]
            ..shuffle()
            ..removeAt(1);

          while (listDigit.length < 3) {
            MathUtil.generateRandomNumber(level, 10 + level, 3)
                .forEach((digit) {
              if (!listDigit.contains(digit)) {
                listDigit.add(digit);
              }
            });
          }
          list.add(getRowFirst(listShape[0], "+", "+", listDigit[0]));
          list.add(getRowSecond(listShape[0], listSign[0], listShape[1], "+",
              listDigit[0], listDigit[1], listDigit[2]));
          list.add(getRowThird(listSign[0], listShape[1], "-", listShape[2],
              listDigit[0], listDigit[1], listDigit[2]));
          list.add(getRowLast(listShape[0], "+", listShape[1], "+",
              listShape[2], listDigit[0], listDigit[1], listDigit[2]));
          break;
      }
    } else {
      while (listDigit.length < 3) {
        MathUtil.generateRandomNumber(level, 10 + level, 3).forEach((digit) {
          if (!listDigit.contains(digit)) {
            listDigit.add(digit);
          }
        });
      }
      listSign = ["+", "-", "*"]..shuffle();
      list.add(
          getRowFirst(listShape[0], listSign[0], listSign[2], listDigit[0]));
      list.add(getRowSecond(listShape[0], listSign[0], listShape[1], "+",
          listDigit[0], listDigit[1], listDigit[2]));
      list.add(getRowThird(listSign[0], listShape[1], "-", listShape[2],
          listDigit[0], listDigit[1], listDigit[2]));
      list.add(getRowLast(listShape[0], listSign[0], listShape[1], listSign[1],
          listShape[2], listDigit[0], listDigit[1], listDigit[2]));
    }
//    list.forEach((list) {
//      print(
//          "${list.picturePuzzleShapeType1} ${list.sign1} ${list.picturePuzzleShapeType2} ${list.sign2} ${list.picturePuzzleShapeType3}");
//    });
//    print("\n");
    return list;
  }

  static PicturePuzzleData getRowFirst(
      PicturePuzzleShapeType picturePuzzleShapeType1,
      String sign1,
      String sign2,
      String op1) {
    print(
        "$op1 $sign1 $op1 $sign2 $op1 ${getResult(op1, sign1, op1, sign2, op1)}");
    return PicturePuzzleData(
        picturePuzzleShapeType1,
        sign1,
        picturePuzzleShapeType1,
        sign2,
        picturePuzzleShapeType1,
        getResult(op1, sign1, op1, sign2, op1));
  }

  static PicturePuzzleData getRowSecond(
      PicturePuzzleShapeType picturePuzzleShapeType1,
      String sign1,
      PicturePuzzleShapeType picturePuzzleShapeType2,
      String sign2,
      String op1,
      String op2,
      String op3) {
    if ((sign1 == "-" && sign2 == "+") || sign1 == "+" && sign2 == "-") {
//      print("dakha 6e aama");
      sign1 = "*";
    }
    print(
        "$op1 $sign1 $op2 $sign2 $op2 ${getResult(op1, sign1, op2, sign2, op2)}");
    return PicturePuzzleData(
        picturePuzzleShapeType1,
        sign1,
        picturePuzzleShapeType2,
        sign2,
        picturePuzzleShapeType2,
        getResult(op1, sign1, op2, sign2, op2));
  }

  static PicturePuzzleData getRowThird(
      String sign1,
      PicturePuzzleShapeType picturePuzzleShapeType2,
      String sign2,
      PicturePuzzleShapeType picturePuzzleShapeType3,
      String op1,
      String op2,
      String op3) {
    if ((sign1 == "-" && sign2 == "+") || sign1 == "+" && sign2 == "-") {
//      print("dakha 6e aama");
      sign2 = "*";
    }
    print(
        "$op2 $sign1 $op3 $sign2 $op3 ${getResult(op2, sign1, op3, sign2, op3)}");
    return PicturePuzzleData(
        picturePuzzleShapeType2,
        sign1,
        picturePuzzleShapeType3,
        sign2,
        picturePuzzleShapeType3,
        getResult(op2, sign1, op3, sign2, op3));
  }

  static PicturePuzzleData getRowLast(
      PicturePuzzleShapeType picturePuzzleShapeType1,
      String sign1,
      PicturePuzzleShapeType picturePuzzleShapeType2,
      String sign2,
      PicturePuzzleShapeType picturePuzzleShapeType3,
      String op1,
      String op2,
      String op3) {
    print(
        "$op1 ${sign1 == "-" ? "+" : sign1} $op2 ${sign2 == "-" ? "+" : sign2} $op3 ${getResult(op1, sign1 == "-" ? "+" : sign1, op2, sign2 == "-" ? "+" : sign2, op3)}");
    return PicturePuzzleData(
        picturePuzzleShapeType1,
        sign1 == "-" ? "+" : sign1,
        picturePuzzleShapeType2,
        sign2 == "-" ? "+" : sign2,
        picturePuzzleShapeType3,
        getResult(op1, sign1 == "-" ? "+" : sign1, op2,
            sign2 == "-" ? "+" : sign2, op3));
  }

  static String getResult(
      String op1, String sign1, String op2, String sign2, String op3) {
    return "${(MathUtil.getPrecedence(sign1) >= MathUtil.getPrecedence(sign2)) ? (MathUtil.evaluate(MathUtil.evaluate(int.parse(op1), sign1, int.parse(op2)), sign2, int.parse(op3))) : (MathUtil.evaluate(int.parse(op1), sign1, MathUtil.evaluate(int.parse(op2), sign2, int.parse(op3))))}";
  }
}

void main() {
//  for (int k = 1; k < 2; k++)
  for (int j = 1; j < 4; j++) {
//    for (int i = 0; i < 5; i++) {
    PicturePuzzleRepository.getPicturePuzzleDataList(j);
//    }
  }
//  print(PicturePuzzleQandSDataProvider.getShapeMatrix());
}
