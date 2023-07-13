part of 'board_cubit.dart';

@immutable
abstract class BoardState {
  bool isValid = false;
  bool isAllFilled = false;

  BoardState({this.isValid = false, this.isAllFilled = false});
}

class BoardInitial extends BoardState {}

class BoardUpdated extends BoardState {}
