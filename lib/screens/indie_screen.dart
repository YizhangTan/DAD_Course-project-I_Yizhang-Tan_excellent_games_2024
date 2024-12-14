import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../widgets/game_card.dart';
import '../utils/responsive_layout.dart';

class IndieScreen extends StatelessWidget {
  final GameController controller;

  const IndieScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indieGames = controller.games.where((game) => game.isIndie).toList();

    final mobileLayout = indieGames.isEmpty
        ? const Center(child: Text('No indie games found!'))
        : ListView.builder(
            itemCount: indieGames.length,
            itemBuilder: (context, index) {
              return GameCard(game: indieGames[index], controller: controller);
            },
          );

    final tabletLayout = indieGames.isEmpty
        ? const Center(child: Text('No indie games found!'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: indieGames.length,
            itemBuilder: (context, index) {
              return GameCard(game: indieGames[index], controller: controller);
            },
          );

    final desktopLayout = indieGames.isEmpty
        ? const Center(child: Text('No indie games found!'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
            ),
            itemCount: indieGames.length,
            itemBuilder: (context, index) {
              return GameCard(game: indieGames[index], controller: controller);
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excellent Indie Games'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        mobileLayout: mobileLayout,
        tabletLayout: tabletLayout,
        desktopLayout: desktopLayout,
      ),
    );
  }
}
