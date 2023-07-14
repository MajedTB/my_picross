class Cell {
  _CellState cellState;

  Cell({this.cellState = _CellState.empty});

  void setFilled() {
    cellState = _CellState.filled;
  }

  void setEmpty() {
    cellState = _CellState.empty;
  }

  void setCrossed() {
    cellState = _CellState.crossed;
  }
}

enum _CellState { filled, crossed, empty }
