import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_picross/cubit/board/board_cubit.dart';

import '../cubit/cell/cell_cubit.dart';
import '../cubit/cell/cell_state.dart';
import '../widgets/cell_widget.dart';

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
    return BlocProvider(
      create: (context) => BoardCubit(),
      child: BlocBuilder<BoardCubit, BoardState>(
        builder: (context, state) {
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
                      "${state.filledCells}/N",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
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
        },
      ),
    );
  }
}
