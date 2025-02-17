import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Your Favorite Items", style: TextStyle(fontSize: 20)),
    );
  }
}