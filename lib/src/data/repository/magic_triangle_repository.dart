import 'package:mathgame/src/data/models/magic_triangle.dart';

class MagicTriangleRepository {
  static Map<String, List<int>> correctMagicTriangle = {
    "9": [1, 2, 3, 4, 5, 6],
    "10": [1, 2, 3, 4, 5, 6],
    "11": [1, 2, 3, 4, 5, 6],
    "12": [1, 2, 3, 4, 5, 6],
    "18": [4, 5, 6, 7, 8, 9],
    "17": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "19": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "20": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "21": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "23": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "126": [1, 4, 9, 16, 25, 36, 49, 64, 81]
  };

  static List<MagicTriangle> getTriangleDataProviderList() {
    List<MagicTriangle> list = [];

    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['9']!),
        getMagicTriangleInput(6),
        9,
      ),
    );

    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['10']!),
        getMagicTriangleInput(6),
        10,
      ),
    );
    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['11']!),
        getMagicTriangleInput(6),
        11,
      ),
    );
    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['12']!),
        getMagicTriangleInput(6),
        12,
      ),
    );
    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['18']!),
        getMagicTriangleInput(6),
        18,
      ),
    );
    list.shuffle();
    return list;
  }

  static List<MagicTriangle> getNextLevelTriangleDataProviderList() {
    List<MagicTriangle> list = [];

    list.add(
      MagicTriangle(
        getMagicTriangleGrid(correctMagicTriangle['20']!),
        getMagicTriangleInput(9),
        20,
      ),
    );

    list.shuffle();
    return list;
  }

  static List<MagicTriangleGrid> getMagicTriangleGrid(List<int> list) {
    List<MagicTriangleGrid> gridList = [];
    for (int i = 0; i < list.length; i++) {
      gridList.add(MagicTriangleGrid(list[i].toString(), true));
    }
    gridList.shuffle();
    return gridList;
  }

  static List<MagicTriangleInput> getMagicTriangleInput(int length) {
    List<MagicTriangleInput> inputList = [];
    for (int i = 0; i < length; i++) {
      inputList.add(MagicTriangleInput(false, ""));
    }
    inputList[0].isActive = false;
    return inputList;
  }
}
