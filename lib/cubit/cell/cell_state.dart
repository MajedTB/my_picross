import 'package:equatable/equatable.dart';

abstract class CellState extends Equatable {
  const CellState();

  @override
  List<Object> get props => [];
}

class CellInitial extends CellState {
  CellInitial() {}
}

class CellEmpty extends CellState {}

class CellFilled extends CellState {}

class CellCrossed extends CellState {}
