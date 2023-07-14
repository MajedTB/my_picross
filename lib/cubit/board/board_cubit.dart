import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  List<cell> board = List.generate(
    10 * 10,
    (index) => cell.empty,
  );
  BoardCubit() : super(BoardInitial());

  void updateCell(int index, bool fillMode) {
    final clickedCell = board[index];
    if (clickedCell != cell.filled && fillMode) {
      board[index] = cell.filled;
    } else if (clickedCell != cell.crossed && !fillMode) {
      board[index] = cell.crossed;
    } else {
      board[index] = cell.empty;
    }

    emit(BoardUpdated());
  }
}

enum cell { filled, crossed, empty }
