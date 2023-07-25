import 'dart:math';

import 'package:my_picross/constants.dart';

class BoardGenerator {
  int? numOfFilled;
  List<cellState>? boardSolution;
  int? size;

  BoardGenerator(this.boardSolution, this.numOfFilled, this.size);
  // TODO: It's possible for a randomly generated Picross board to have more than one solution

  BoardGenerator.random10x10() {
    final random = Random();
    List<cellState> randomBoard = [];
    int numFilledOnRandom = 0;
    for (int i = 0; i < 10 * 10; i++) {
      if (random.nextBool()) {
        randomBoard.add(cellState.filled);
        numFilledOnRandom++;
      } else {
        randomBoard.add(cellState.crossed);
      }
    }

    this.boardSolution = randomBoard;
    this.numOfFilled = numFilledOnRandom;
    this.size = 10;
  }

  List<List<int>> getHorizontalHints() {
    List<List<int>> horizontalHints = [];

    for (int i = 0; i < size!; i++) {
      List<int> rowHint = [];
      int successiveFilled = 0;
      for (int j = 0; j < size!; j++) {
        int index = i * size! + j;
        if (boardSolution![index] == cellState.filled) {
          successiveFilled++;
        } else {
          if (successiveFilled != 0) {
            rowHint.add(successiveFilled);
          }
          successiveFilled = 0;
        }
      }
      if (successiveFilled != 0) {
        rowHint.add(successiveFilled);
      }
      horizontalHints.add(rowHint);
    }

    return horizontalHints;
  }

  List<List<int>> getVerticalHints() {
    List<List<int>> verticalHints = [];

    for (int i = 0; i < size!; i++) {
      List<int> columnHint = [];
      int successiveFilled = 0;
      for (int j = i; j < boardSolution!.length; j += size!) {
        if (boardSolution![j] == cellState.filled) {
          successiveFilled++;
        } else {
          if (successiveFilled != 0) {
            columnHint.add(successiveFilled);
          }
          successiveFilled = 0;
        }
      }
      if (successiveFilled != 0) {
        columnHint.add(successiveFilled);
      }
      verticalHints.add(columnHint);
    }

    return verticalHints;
  }

  @override
  String toString() {
    String str = "";

    int boardLength = sqrt(boardSolution!.length).toInt();
    for (int i = 0; i < boardLength; i++) {
      for (int j = 0; j < boardLength; j++) {
        int index = i * boardLength + j;
        str += "${boardSolution![index] == cellState.filled ? 'X' : ' '}";
      }
      str += "\n";
    }
    return str;
  }
}
