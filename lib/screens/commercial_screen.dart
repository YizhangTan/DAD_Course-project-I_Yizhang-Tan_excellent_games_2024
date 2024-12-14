import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../widgets/game_card.dart';
import '../utils/responsive_layout.dart';

class CommercialScreen extends StatelessWidget {
  final GameController controller;

  const CommercialScreen({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commercialGames =
        controller.games.where((game) => !game.isIndie).toList();

    final mobileLayout = commercialGames.isEmpty
        ? const Center(child: Text('No commercial games found!'))
        : ListView.builder(
            itemCount: commercialGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                  game: commercialGames[index], controller: controller);
            },
          );

    final tabletLayout = commercialGames.isEmpty
        ? const Center(child: Text('No commercial games found!'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: commercialGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                  game: commercialGames[index], controller: controller);
            },
          );

    final desktopLayout = commercialGames.isEmpty
        ? const Center(child: Text('No commercial games found!'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
            ),
            itemCount: commercialGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                  game: commercialGames[index], controller: controller);
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excellent Commercial Games'),
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
