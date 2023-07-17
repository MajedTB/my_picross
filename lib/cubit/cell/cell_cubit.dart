import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cell_state.dart';

class CellCubit extends Cubit<CellState> {
  CellCubit() : super(CellInitial());

  void setFilled() {
    emit(CellFilled());
  }

  void setCrossed() {
    emit(CellCrossed());
  }

  void setEmpty() {
    emit(CellEmpty());
  }
}
