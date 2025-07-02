import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final Color color;
  final int audioNumber;

  const Tile({super.key, required this.color, required this.audioNumber});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  late final AudioPlayer _player;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _playSound() async {
    try {
      await _player.stop();
      await _player.play(AssetSource('audio${widget.audioNumber}.wav'));
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color displayColor = _isPressed
        ? darkenColor(widget.color, 0.2)
        : widget.color;

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: _playSound,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: displayColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Color darkenColor(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkened.toColor();
  }
}
