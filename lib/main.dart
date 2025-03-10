import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/breakout_game.dart';

void main() {
  runApp(
    GameWidget(
      game: BreakoutGame(),
    ),
  );
}
