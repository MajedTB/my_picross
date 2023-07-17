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
        randomBoard.add(cellState.empty);
      }
    }

    this.boardSolution = randomBoard;
    this.numOfFilled = numFilledOnRandom;
  }
}
