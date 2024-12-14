import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controllers/game_controller.dart';
import 'screens/home_screen.dart';
import 'utils/data.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final gameBox = await Hive.openBox('games');

  if (gameBox.get('allGames') == null ||
      (gameBox.get('allGames') as List).isEmpty) {
    gameBox.put(
      'allGames',
      initialGames.map((game) => game.toJson()).toList(),
    );
  }

  runApp(const ExcellentGamesApp());
}

class ExcellentGamesApp extends StatelessWidget {
  const ExcellentGamesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GameController();
    return MaterialApp(
      title: '2024 Excellent Games',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomeScreen(controller: controller),
    );
  }
}
