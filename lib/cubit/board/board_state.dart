part of 'board_cubit.dart';

// TODO: Remark: the user must fill the board all with filled & crosses (no empty)
// TODO: auto crossing

@immutable
class BoardState {
  final int filledCells;
  final List<cellState> board;

  BoardState({required this.board, this.filledCells = 0});

  // property list from Equatable, to update states
  @override
  List<Object?> get props => [board, filledCells];
}
