import 'package:flutter/material.dart';
import 'package:my_picross/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Picross',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Picross"),
          backgroundColor: Colors.grey,
        ),
        body: GameScreen(),
      ),
    );
  }
}
