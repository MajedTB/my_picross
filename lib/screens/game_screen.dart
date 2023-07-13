import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/board/board_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardCubit(),
      child: Container(
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
            // Grid
            BlocBuilder<BoardCubit, BoardState>(
              builder: (context, state) {
                return Expanded(
                  child: GridView.builder(
                      itemCount: 10 * 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<BoardCubit>()
                                .updateCell(index, _fillMode);
                          },
                          child: Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: 1)),
                            child: Center(
                              child: Icon(Icons.close),
                            ),
                          ),
                        );
                      }),
                );
              },
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
      ),
    );
  }
}
