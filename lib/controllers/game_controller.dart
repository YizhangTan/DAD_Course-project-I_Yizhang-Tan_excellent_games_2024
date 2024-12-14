import 'package:hive/hive.dart';
import '../models/game.dart';

class GameController {
  final Box _gameBox = Hive.box('games');

  List<Game> get games {
    final storedGames = _gameBox.get('allGames', defaultValue: []);
    return (storedGames as List)
        .map((e) => Game.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void addGame(Game game) {
    final currentGames = games;
    currentGames.add(game);
    _gameBox.put('allGames', currentGames.map((e) => e.toJson()).toList());
  }

  void saveFavorites(List<Game> favorites) {
    _gameBox.put('favorites', favorites.map((e) => e.toJson()).toList());
  }

  List<Game> getFavorites() {
    final storedFavorites = _gameBox.get('favorites', defaultValue: []);
    return (storedFavorites as List)
        .map((e) => Game.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void toggleFavorite(Game game) {
    final favorites = getFavorites();
    if (favorites.any((g) => g.name == game.name)) {
      favorites.removeWhere((g) => g.name == game.name);
    } else {
      favorites.add(game);
    }
    saveFavorites(favorites);
  }

  bool isFavorite(Game game) {
    return getFavorites().any((g) => g.name == game.name);
  }
}
