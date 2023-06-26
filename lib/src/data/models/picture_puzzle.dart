class PicturePuzzle {
  late List<PicturePuzzleShapeList> list;
  late int answer;

  PicturePuzzle(this.list, this.answer);

  @override
  String toString() {
    return 'PicturePuzzle{list: $list}';
  }
}

class PicturePuzzleShapeList {
  late List<PicturePuzzleShape> shapeList;

  PicturePuzzleShapeList(this.shapeList);

  @override
  String toString() {
    return 'PicturePuzzleShapeList{shapeList: $shapeList}';
  }
}

class PicturePuzzleShape {
  late bool isSign;
  late bool isAnswer;
  late PicturePuzzleShapeType picturePuzzleShapeType;
  late String text;

  PicturePuzzleShape({
    required this.isSign,
    required this.picturePuzzleShapeType,
    required this.isAnswer,
    required this.text,
  });

  @override
  String toString() {
    return 'PicturePuzzleShape{isSign: $isSign, picturePuzzleShapeType: $picturePuzzleShapeType, sign: $text}';
  }
}

class PicturePuzzleData {
  late PicturePuzzleShapeType picturePuzzleShapeType1;
  late String sign1;
  late PicturePuzzleShapeType picturePuzzleShapeType2;
  late String sign2;
  late PicturePuzzleShapeType picturePuzzleShapeType3;
  late String text;

  PicturePuzzleData(
      this.picturePuzzleShapeType1,
      this.sign1,
      this.picturePuzzleShapeType2,
      this.sign2,
      this.picturePuzzleShapeType3,
      this.text,
      );

  @override
  String toString() {
    return 'PicturePuzzleData{picturePuzzleShapeType1: $picturePuzzleShapeType1, sign1: $sign1, picturePuzzleShapeType2: $picturePuzzleShapeType2, sign2: $sign2, picturePuzzleShapeType3: $picturePuzzleShapeType3, text: $text}';
  }
}

enum PicturePuzzleShapeType { CIRCLE, SQUARE, TRIANGLE }
