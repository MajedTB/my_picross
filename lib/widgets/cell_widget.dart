import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_picross/cubit/board/board_cubit.dart';

import '../constants.dart';

class CellWidget extends StatelessWidget {
  final bool fillMode;
  final int index;

  const CellWidget({
    super.key,
    required this.fillMode,
    required this.index,
  });

  Widget _getCellWidget(cellState state) {
    print("state is ${state}");
    if (state == cellState.filled) {
      return Container(color: Colors.black);
    } else if (state == cellState.crossed) {
      return Icon(Icons.close);
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO try to omit blocbuilder and see
    return BlocBuilder<BoardCubit, BoardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<BoardCubit>(context).toggleCell(
              fillModeEnabled: fillMode,
              index: index,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
            child: Center(
              child: _getCellWidget(state.board[index]),
            ),
          ),
        );
      },
    );
  }
}
