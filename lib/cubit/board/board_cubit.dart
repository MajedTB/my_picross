import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_picross/models/board_generator.dart';

import '../../constants.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  final BoardGenerator generatedBoard;

  BoardCubit({required this.generatedBoard})
      : super(BoardState(board: List.filled(10 * 10, cellState.empty)));

  void toggleCell({index, fillModeEnabled}) {
    List<cellState> newBoard = List.from(state.board);
    int newFilledCells = state.filledCells;

    if (newBoard[index] != cellState.filled && fillModeEnabled) {
      newBoard[index] = cellState.filled;
      newFilledCells++;
    } else if (newBoard[index] != cellState.crossed && !fillModeEnabled) {
      newBoard[index] = cellState.crossed;
    } else {
      newBoard[index] = cellState.empty;
    }

    // if cell was filled and got unfilled, then decrement filledCells
    if (state.board[index] == cellState.filled &&
        newBoard[index] != state.board[index]) {
      newFilledCells--;
    }

    emit(BoardState(
      board: newBoard,
      filledCells: newFilledCells,
    ));

    // TODO if (new Filled Cells = length) checkifwin
  }
}
