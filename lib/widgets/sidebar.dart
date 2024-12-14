import 'package:flutter/material.dart';
import '../screens/indie_screen.dart';
import '../screens/commercial_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/add_new_screen.dart';
import '../controllers/game_controller.dart';

class Sidebar extends StatelessWidget {
  final GameController controller;

  const Sidebar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Navigation',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Excellent Indie Games'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndieScreen(controller: controller),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Excellent Commercial Games'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CommercialScreen(controller: controller),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Favorites'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(controller: controller),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Add New Game'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewScreen(controller: controller),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
