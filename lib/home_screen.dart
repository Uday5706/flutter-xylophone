import 'package:flutter/material.dart';

import 'tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Xylophone', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 8, // 👈 This adds a shadow below the AppBar
        shadowColor: Colors.black.withAlpha((0.8 * 255).toInt()),
        backgroundColor: Color(0xFF6A67FF),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(
                  (0.5 * 255).toInt(),
                ), // shadow color with opacity
                spreadRadius: 5, // how much the shadow spreads
                blurRadius: 7, // how soft the shadow is
                offset: Offset(0, 3), // x, y position of the shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Tile(color: Colors.redAccent, audioNumber: 1),
              Tile(color: Colors.orangeAccent, audioNumber: 2),
              Tile(color: Colors.yellowAccent, audioNumber: 3),
              Tile(color: Colors.greenAccent, audioNumber: 4),
              Tile(color: Colors.blueAccent, audioNumber: 5),
              Tile(color: Colors.indigoAccent, audioNumber: 6),
              Tile(color: Colors.purpleAccent, audioNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
