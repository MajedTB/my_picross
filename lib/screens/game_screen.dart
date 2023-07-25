import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_picross/cubit/board/board_cubit.dart';
import 'package:my_picross/models/board_generator.dart';

import '../constants.dart';
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
  // TODO: change board
  BoardGenerator boardSolution = BoardGenerator.random10x10();
  List<List<int>>? horizontalHints, verticalHints;

  @override
  void initState() {
    horizontalHints = boardSolution.getHorizontalHints();
    verticalHints = boardSolution.getVerticalHints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardCubit(boardSolution: boardSolution),
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
                      "${state.filledCells}/${BlocProvider.of<BoardCubit>(context).boardSolution.numOfFilled}",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                // Grid
                Expanded(
                  child: GridView.builder(
                      itemCount: state.board.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          // Return widget for top-left cell
                          return Center(child: Text('Top-Left'));
                        } else if (index < 10) {
                          // Return widget for top row
                          return Container(
                            child: Center(
                              child: ListView.builder(
                                itemBuilder: (context, listIndex) {
                                  return Text(
                                    "${verticalHints![index][listIndex]}",
                                  );
                                },
                                itemCount: verticalHints![index].length,
                              ),
                            ),
                          );
                          return Center(child: Text('Top $index'));
                        } else if (index % 10 == 0) {
                          // Return widget for left column
                          return Center(child: Text('Left ${index ~/ 10}'));
                        } else {
                          // Return widget for cell content
                          return CellWidget(fillMode: _fillMode, index: index);
                        }
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
