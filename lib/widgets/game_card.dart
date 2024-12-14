import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/game.dart';
import '../controllers/game_controller.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final GameController controller;

  const GameCard({Key? key, required this.game, required this.controller})
      : super(key: key);

  Future<void> _launchSteamLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Game> favorites = controller.getFavorites();
    final bool isFavorite = favorites.any((g) => g.name == game.name);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            if (game.steamLink != null && game.steamLink!.isNotEmpty) {
              _launchSteamLink(game.steamLink!);
            }
          },
          child: Image.asset(
            game.imagePath,
            width: 100,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(game.name),
        subtitle: Text('${game.category} • ${game.honor}'),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            final List<Game> updatedFavorites = List.from(favorites);

            if (isFavorite) {
              updatedFavorites.removeWhere((g) => g.name == game.name);
            } else {
              updatedFavorites.add(game);
            }

            controller.saveFavorites(updatedFavorites);
            (context as Element).markNeedsBuild();
          },
        ),
      ),
    );
  }
}
