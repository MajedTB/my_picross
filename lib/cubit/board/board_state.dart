part of 'board_cubit.dart';

@immutable
abstract class BoardState {
  bool isValid = false;
  bool isAllFilled = false;

  // TODO: board model should have numberOfFilledCells

  BoardState({this.isValid = false, this.isAllFilled = false});
}

class BoardInitial extends BoardState {}

class BoardUpdated extends BoardState {}
