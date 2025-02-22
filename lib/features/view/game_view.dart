import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late SpriteComponent player;
  Vector2 velocity = Vector2(100, 100); // Hareket hızı

  @override
  Future<void> onLoad() async {
    await Flame.images.load('player.png');

    player = SpriteComponent()
      ..sprite = await loadSprite('player.png')
      ..size = Vector2(100, 100)
      ..position = size / 2;

    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.position += velocity * dt; // Zamanla konumu değiştir

    // Ekran sınırlarına çarpınca yön değiştir
    if (player.x <= 0 || player.x >= size.x - player.width) {
      velocity.x = -velocity.x;
    }
    if (player.y <= 0 || player.y >= size.y - player.height) {
      velocity.y = -velocity.y;
    }
  }
}

// Oyun ekranını içeren yeni bir sayfa
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: MyGame()), // Oyun burada çalışıyor
          Positioned(
            top: 40,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Menüye geri dön
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text("Menüye Dön"),
            ),
          ),
        ],
      ),
    );
  }
}
