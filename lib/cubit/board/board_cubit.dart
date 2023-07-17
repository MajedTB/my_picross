import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_picross/models/board.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  final List<bool>? solution;

  BoardCubit(this.solution) {
    super(BoardInitial());
    this.solution = Board.random10().solution;
  }

  void incrementFilledCells() {
    print(state.filledCells);
    emit(BoardUpdated(state.filledCells + 1));
  }

  void decrementFilledCells() {
    print(state.filledCells);
    emit(BoardUpdated(state.filledCells - 1));
  }
}
