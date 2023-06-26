class MathGrid {
  late int id;
  late List<MathGridCellModel> listForSquare;
  late List<int> listOfAnswer;
  late int currentAnswer;

  MathGrid(this.id, this.listForSquare, this.listOfAnswer) {
    currentAnswer = listOfAnswer[0];
  }
}

class MathGridCellModel {
  late int index;
  late int value;
  late bool isActive;
  late bool isRemoved;

  MathGridCellModel(this.index, this.value, this.isActive, this.isRemoved);
}
