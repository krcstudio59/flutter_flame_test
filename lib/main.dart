import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  late SpriteComponent player;

  @override
  Future<void> onLoad() async {
    await Flame.images.load(
      'player.png',
    ); // assets/images/player.png olarak yüklenecek
    player =
        SpriteComponent()
          ..sprite = await loadSprite('player.png')
          ..size = Vector2(100, 100)
          ..position = size / 2; // Ekranın ortasına koy

    add(player);
  }
}
