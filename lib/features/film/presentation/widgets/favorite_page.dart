import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite", style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text(
          "Favorite Page",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
