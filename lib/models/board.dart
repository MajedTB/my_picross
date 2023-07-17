import 'dart:math';

class Board {
  List<bool> solution;
  Board({required this.solution});

  static random10() {
    final random = Random();
    Board(solution: List.generate(10 * 10, (index) => random.nextBool()));
  }
}
