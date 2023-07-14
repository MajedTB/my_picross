import 'package:bloc/bloc.dart';
import 'package:my_picross/models/cell.dart';

import 'cell_state.dart';

class CellCubit extends Cubit<CellState> {
  CellCubit() : super(CellInitial());

  // void setFilled() {
  //   Cell newCell = Cell();
  //   newCell.setEmpty();
  //   emit(CellEmpty(newCell));
  //   print("emitted filled");
  // }
  //
  // void setCrossed() {
  //   Cell newCell = Cell();
  //   newCell.setCrossed();
  //   emit(CellEmpty(newCell));
  //   print("emitted crossed");
  // }
  //
  // void setEmpty() {
  //   Cell newCell = Cell();
  //   newCell.setEmpty();
  //   emit(CellEmpty(newCell));
  //   print("emitted empty");
  // }
  //
//  /////////////////////

  void setFilled() {
    print("-------");
    print(state);
    emit(CellFilled());
    print("emitted filled");
    print(state);
    print("-------");
  }

  void setCrossed() {
    emit(CellCrossed());
    print("emitted crossed");
  }

  void setEmpty() {
    emit(CellEmpty());
    print("emitted empty");
  }
}
