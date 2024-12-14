class Game {
  final String name;
  final String category;
  final double rating;
  final String honor;
  final String imagePath;
  final bool isIndie;
  final String? steamLink;

  Game({
    required this.name,
    required this.category,
    required this.rating,
    required this.honor,
    required this.imagePath,
    required this.isIndie,
    this.steamLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'rating': rating,
      'honor': honor,
      'imagePath': imagePath,
      'isIndie': isIndie,
      'steamLink': steamLink,
    };
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      name: json['name'],
      category: json['category'],
      rating: json['rating'],
      honor: json['honor'],
      imagePath: json['imagePath'],
      isIndie: json['isIndie'],
      steamLink: json['steamLink'],
    );
  }
}
