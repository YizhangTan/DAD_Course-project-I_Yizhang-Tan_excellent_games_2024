import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../widgets/sidebar.dart';
import '../utils/responsive_layout.dart';
import '../widgets/game_card.dart';

class HomeScreen extends StatefulWidget {
  final GameController controller;

  const HomeScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List gamesToShow = [];

  @override
  void initState() {
    super.initState();
    _initializeGames();
  }

  void _initializeGames() {
    final allGames = widget.controller.games;
    if (allGames.isNotEmpty) {
      gamesToShow = allGames.toList()..shuffle();
      gamesToShow = gamesToShow.take(3).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mobileLayout = gamesToShow.isEmpty
        ? const Center(
            child: Text(
              'No games available. Add some new games!',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            itemCount: gamesToShow.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: gamesToShow[index],
                controller: widget.controller,
              );
            },
          );

    final tabletLayout = gamesToShow.isEmpty
        ? const Center(
            child: Text(
              'No games available. Add some new games!',
              style: TextStyle(fontSize: 18),
            ),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: gamesToShow.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: gamesToShow[index],
                controller: widget.controller,
              );
            },
          );

    final desktopLayout = gamesToShow.isEmpty
        ? const Center(
            child: Text(
              'No games available. Add some new games!',
              style: TextStyle(fontSize: 18),
            ),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
            ),
            itemCount: gamesToShow.length,
            itemBuilder: (context, index) {
              return GameCard(
                game: gamesToShow[index],
                controller: widget.controller,
              );
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('2024 Excellent Games'),
        centerTitle: true,
      ),
      drawer: Sidebar(controller: widget.controller),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Hey you, you're finally awake? It's 2024 now!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Here are some excellent games you might like:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
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
