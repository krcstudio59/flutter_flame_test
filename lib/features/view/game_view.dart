import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late SpriteComponent player;
  Vector2 velocity = Vector2(100, 100); // Hareket hızı
  bool isRotating = false; // Dönme kontrolü

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
    player.position += velocity * dt; // Topun hareketi

    // Eğer butona basılı tutuluyorsa top dönsün
    if (isRotating) {
      player.angle += 3 * dt; // 3 rad/s hızında döndür
    }

    // Ekran sınırlarına çarpınca yön değiştir
    if (player.x <= 0 || player.x >= size.x - player.width) {
      velocity.x = -velocity.x;
    }
    if (player.y <= 0 || player.y >= size.y - player.height) {
      velocity.y = -velocity.y;
    }
  }

  // Butona basılınca döndürmeyi başlat
  void startRotation() {
    isRotating = true;
  }

  // Butondan el çekilince döndürmeyi durdur
  void stopRotation() {
    isRotating = false;
  }
}

// Oyun ekranını içeren yeni bir sayfa
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyGame game = MyGame(); // Oyun nesnesini oluşturduk

    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: game), // Oyun burada çalışıyor

          // Menüye dönüş butonu (Sol üst köşe)
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

          // DÖN butonu (Orta alt kısım, basılı tutulunca dönecek)
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onLongPress: () {
                  game.startRotation(); // Basılı tutulduğunda başlat
                },
                onLongPressUp: () {
                  game.stopRotation(); // Bırakıldığında durdur
                },
                child: ElevatedButton(
                  onPressed: () {}, // Normal tıklamada bir şey yapma
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Buton boyutu
                  ),
                  child: const Text("BASILI TUT"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
