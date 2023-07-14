import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/cell.dart';

// abstract class CellState extends Equatable {
//   final Widget? icon;
//   const CellState({this.icon});
//
//   @override
//   List<Object?> get props => [icon];
// }
//
// class CellInitial extends CellState {
//   CellInitial() : super();
// }
//
// class CellEmpty extends CellState {
//   const CellEmpty() : super();
// }
//
// class CellFilled extends CellState {
//   CellFilled() : super(icon: Container(color: Colors.black));
// }
//
// class CellCrossed extends CellState {
//   const CellCrossed() : super(icon: const Icon(Icons.close));
// }
////////////////////////
// abstract class CellState extends Equatable {
//   final Cell cell;
//   const CellState(this.cell);
//
//   @override
//   List<Object> get props => [cell];
// }
//
// class CellInitial extends CellState {
//   CellInitial() : super(Cell());
// }
//
// class CellEmpty extends CellState {
//   final Cell newCell;
//   const CellEmpty(this.newCell) : super(newCell);
// }
//
// class CellFilled extends CellState {
//   final Cell newCell;
//   const CellFilled(this.newCell) : super(newCell);
// }
//
// class CellCrossed extends CellState {
//   final Cell newCell;
//   const CellCrossed(this.newCell) : super(newCell);
// }

/////////////////

abstract class CellState extends Equatable {
  const CellState();

  @override
  List<Object> get props => [];
}

class CellInitial extends CellState {
  CellInitial() : super();
}

class CellEmpty extends CellState {}

class CellFilled extends CellState {}

class CellCrossed extends CellState {}
