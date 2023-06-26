class MagicTriangle {
  late bool is3x3;

  late List<MagicTriangleGrid> listGrid;
  late List<MagicTriangleInput> listTriangle;
  late int availableDigit;
  late int answer;

  MagicTriangle(this.listGrid, this.listTriangle, this.answer) {
    this.availableDigit = listGrid.length;
    this.is3x3 = listGrid.length == 6 ? true : false;
  }

  bool checkTotal() {
    if (is3x3) {
      int sumOfLeftSide = (int.parse(listTriangle[0].value) +
          int.parse(listTriangle[1].value) +
          int.parse(listTriangle[3].value));
      int sumOfRightSide = (int.parse(listTriangle[0].value) +
          int.parse(listTriangle[2].value) +
          int.parse(listTriangle[5].value));
      int sumOfBottomSide = (int.parse(listTriangle[3].value) +
          int.parse(listTriangle[4].value) +
          int.parse(listTriangle[5].value));
      if (answer == sumOfLeftSide &&
          answer == sumOfRightSide &&
          answer == sumOfBottomSide) {
        return true;
      } else {
        return false;
      }
    } else {
      int sumOfLeftSide = (int.parse(listTriangle[0].value) +
          int.parse(listTriangle[1].value) +
          int.parse(listTriangle[3].value) +
          int.parse(listTriangle[5].value));
      int sumOfRightSide = (int.parse(listTriangle[0].value) +
          int.parse(listTriangle[2].value) +
          int.parse(listTriangle[4].value) +
          int.parse(listTriangle[8].value));
      int sumOfBottomSide = (int.parse(listTriangle[5].value) +
          int.parse(listTriangle[6].value) +
          int.parse(listTriangle[7].value) +
          int.parse(listTriangle[8].value));
      if (answer == sumOfLeftSide &&
          answer == sumOfRightSide &&
          answer == sumOfBottomSide) {
        return true;
      } else {
        return false;
      }
    }
  }
}

class MagicTriangleGrid {
  late String value;
  late bool isVisible;

  MagicTriangleGrid(this.value, this.isVisible);
}

class MagicTriangleInput {
  late bool isActive;
  late String value;

  MagicTriangleInput(this.isActive, this.value);
}
