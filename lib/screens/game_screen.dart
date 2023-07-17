import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_picross/cubit/board/board_cubit.dart';

import '../cubit/cell/cell_cubit.dart';
import '../cubit/cell/cell_state.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // final BoardCubit _boardCubit = BoardCubit();
  // final CellCubit _cellCubit = CellCubit();
  // MultipBlockB+PORVIEr
  bool _fillMode = true;

  final List<CellCubit> cells = List.generate(
    10 * 10,
    (index) => CellCubit(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Score Counter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.square, size: 32),
              SizedBox(width: 5),
              Text(
                "M/N",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(border: Border.all()),
          //   child: BlocBuilder<CellCubit, CellState>(
          //     builder: (context, state) {
          //       return GestureDetector(
          //         onTap: () {
          //           if (state is! CellFilled && _fillMode) {
          //             context.read<CellCubit>().setFilled();
          //           } else if (state is! CellCrossed && !_fillMode) {
          //             context.read<CellCubit>().setCrossed();
          //           } else {
          //             context.read<CellCubit>().setEmpty();
          //           }
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             border: Border.all(width: 1),
          //           ),
          //           child: Center(
          //             child: getCellWidget(state),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // Grid
          Expanded(
            child: GridView.builder(
                itemCount: 10 * 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BlocProvider.value(
                    value: cells[index],
                    child: CellWidget(fillMode: _fillMode),
                  );
                }),
          ),
          ToggleButtons(
              onPressed: (index) {
                setState(() {
                  _fillMode = !_fillMode;
                });
              },
              isSelected: [!_fillMode, _fillMode],
              children: [Icon(Icons.close), Icon(Icons.square)]),
        ],
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  final bool fillMode;

  const CellWidget({
    super.key,
    required this.fillMode,
  });

  Widget _getCellWidget(CellState state) {
    print("state is ${state}");
    if (state is CellFilled) {
      return Container(color: Colors.black87);
    } else if (state is CellCrossed) {
      return Icon(Icons.close);
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
            } else if (state is! CellCrossed && !fillMode) {
              context.read<CellCubit>().setCrossed();
            } else {
              context.read<CellCubit>().setEmpty();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
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
