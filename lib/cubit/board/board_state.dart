part of 'board_cubit.dart';

@immutable
abstract class BoardState {
  final int filledCells;

  BoardState({required this.filledCells});

  // property list from Equatable, to update states
  @override
  List<Object?> get props => [filledCells];
}

class BoardInitial extends BoardState {
  BoardInitial() : super(filledCells: 0);
}

class BoardUpdated extends BoardState {
  int newValue;
  BoardUpdated(this.newValue) : super(filledCells: newValue);
}
