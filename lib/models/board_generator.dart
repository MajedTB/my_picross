import 'dart:math';

import 'package:my_picross/constants.dart';

class BoardGenerator {
  int? numOfFilled;
  List<cellState>? boardSolution;

  BoardGenerator(this.boardSolution, this.numOfFilled);
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
    getHorizontalHints(); // tmp
  }

  List<List<int>> getHorizontalHints() {
    List<List<int>> horizontalHints = [];

    int boardLength = sqrt(boardSolution!.length).toInt();
    for (int i = 0; i < boardLength; i++) {
      List<int> rowHint = [];
      int consecutiveFilled = 0;
      for (int j = 0; j < boardLength; j++) {
        int index = i * boardLength + j;
        if (boardSolution![index] == cellState.filled) {
          consecutiveFilled++;
        } else {
          if (consecutiveFilled != 0) {
            rowHint.add(consecutiveFilled);
          }
          consecutiveFilled = 0;
        }
      }
      horizontalHints.add(rowHint);
    }

    print(toString());
    print(horizontalHints);
    return horizontalHints;
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
