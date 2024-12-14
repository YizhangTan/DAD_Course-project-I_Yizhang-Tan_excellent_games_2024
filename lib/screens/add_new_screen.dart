import 'package:flutter/material.dart';
import '../models/game.dart';
import '../controllers/game_controller.dart';

class AddNewScreen extends StatefulWidget {
  final GameController controller;

  const AddNewScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String category = '';
  double rating = 0;
  String honor = '';
  String imagePath = '';
  bool isIndie = false;

  void addGame() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newGame = Game(
        name: name,
        category: category,
        rating: rating,
        honor: honor,
        imagePath: imagePath,
        isIndie: isIndie,
      );
      widget.controller.addGame(newGame);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (value) => category = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a category' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
                onSaved: (value) => rating = double.parse(value!),
                validator: (value) =>
                    value!.isEmpty || double.tryParse(value) == null
                        ? 'Enter a valid rating'
                        : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Honor'),
                onSaved: (value) => honor = value!,
                validator: (value) => value!.isEmpty ? 'Enter an honor' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Image Path'),
                onSaved: (value) => imagePath = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Enter an image path' : null,
              ),
              SwitchListTile(
                title: const Text('Is Indie Game'),
                value: isIndie,
                onChanged: (value) {
                  setState(() {
                    isIndie = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: addGame,
                child: const Text('Add Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
