import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../widgets/game_card.dart';
import '../utils/responsive_layout.dart';

class FavoritesScreen extends StatelessWidget {
  final GameController controller;

  const FavoritesScreen({Key? key, required this.controller}) : super(key: key);

  double calculateAverageRating(List games) {
    if (games.isEmpty) return 0;
    return games.map((e) => e.rating).reduce((a, b) => a + b) / games.length;
  }

  @override
  Widget build(BuildContext context) {
    final favoriteGames = controller.getFavorites();
    final averageRating = calculateAverageRating(favoriteGames);

    final mobileLayout = favoriteGames.isEmpty
        ? const Center(child: Text('No favorite games added yet.'))
        : ListView.builder(
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: favoriteGames[index],
                controller: controller,
              );
            },
          );

    final tabletLayout = favoriteGames.isEmpty
        ? const Center(child: Text('No favorite games added yet.'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: favoriteGames[index],
                controller: controller,
              );
            },
          );

    final desktopLayout = favoriteGames.isEmpty
        ? const Center(child: Text('No favorite games added yet.'))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
            ),
            itemCount: favoriteGames.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: favoriteGames[index],
                controller: controller,
              );
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Games'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Average Rating: ${averageRating.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ResponsiveLayout(
              mobileLayout: mobileLayout,
              tabletLayout: tabletLayout,
              desktopLayout: desktopLayout,
            ),
          ),
        ],
      ),
    );
  }
}
