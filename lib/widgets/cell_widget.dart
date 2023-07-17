import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_picross/cubit/board/board_cubit.dart';

import '../cubit/cell/cell_cubit.dart';
import '../cubit/cell/cell_state.dart';

class CellWidget extends StatelessWidget {
  final bool fillMode;

  const CellWidget({
    super.key,
    required this.fillMode,
  });

  Widget _getCellWidget(CellState state) {
    print("state is ${state}");
    if (state is CellFilled) {
      return Container(color: Colors.black);
    } else if (state is CellCrossed) {
      return Icon(
        Icons.close,
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CellCubit, CellState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // print("${index} ${state} ${_fillMode} ${state is! CellFilled}");
            if (state is! CellFilled && fillMode) {
              context.read<CellCubit>().setFilled();
              context.read<BoardCubit>().incrementFilledCells();
            } else if (state is! CellCrossed && !fillMode) {
              context.read<CellCubit>().setCrossed();
              context.read<BoardCubit>().decrementFilledCells();
            } else {
              context.read<CellCubit>().setEmpty();
              context.read<BoardCubit>().decrementFilledCells();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
            child: Center(
              child: _getCellWidget(state),
            ),
          ),
        );
      },
    );
  }
}
