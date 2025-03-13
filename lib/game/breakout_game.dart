import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_test/game/levels/brick_matris_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'paddle.dart';
import 'ball.dart';
import './bricks/normal_brick.dart';
import './bricks/solid_brick.dart';
import './levels/brick_matris.dart'; // Sabit matrisimizi import ediyoruz

late List<List<int>> brickMatrix;

class BreakoutGame extends FlameGame
    with HasCollisionDetection, PanDetector, MouseMovementDetector {
  late Paddle paddle;
  late Ball ball;

  // Paddle'ın hedef konumu (dokunma veya fare hareketi ile güncellenecek)
  double paddleTargetX = 0.0;

  @override
  Color backgroundColor() => const Color(0xFFEAEAEA);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Paddle oluşturuluyor
    paddle = Paddle(
      position: Vector2(size.x / 2 - 50, size.y - 50),
      size: Vector2(100, 20),
    );
    add(paddle);
    // Başlangıçta paddle'ın hedef konumu, mevcut konumuna eşit
    paddleTargetX = paddle.x;

    // Top oluşturuluyor
    ball = Ball(
      position: Vector2(size.x / 2, size.y / 2),
      size: Vector2(10, 10),
      velocity: Vector2(200, -200),
    );
    add(ball);

    brickMatrix = await loadBrickMatrix();

// Matrise göre Brick ekleme:
    final double brickWidth = 10.0.w; // screenutil kullanıyorsanız
    final double brickHeight = 10.0.h;
    for (int row = 0; row < brickMatrix.length; row++) {
      for (int col = 0; col < brickMatrix[row].length; col++) {
        final cell = brickMatrix[row][col];
        if (cell == 1) {
          // Normal brick ekle
          final brick = Brick(
            position:
                Vector2(col * brickWidth + 25.w, row * brickHeight + 25.h),
            size: Vector2(brickWidth, brickHeight),
          );
          add(brick);
        } else if (cell == 2) {
          // Solid brick ekle
          final solidBrick = SolidBrick(
            position:
                Vector2(col * brickWidth + 25.w, row * brickHeight + 25.h),
            size: Vector2(brickWidth, brickHeight),
          );
          add(solidBrick);
        }
        // Eğer cell 0 ise, hiçbir şey eklenmez.
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Paddle'ı, hedef konumuna doğru belirlenen hızla hareket ettiriyoruz.
    double diff = paddleTargetX - paddle.x;
    double speed = 800; // Piksel/saniye cinsinden hareket hızı
    if (diff.abs() < speed * dt) {
      paddle.x = paddleTargetX;
    } else {
      paddle.x += speed * dt * diff.sign;
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Dokunma sırasında paddle'ın hedef konumunu güncelliyoruz.
    final localPosition = info.eventPosition.global;
    paddleTargetX = (localPosition.x - paddle.size.x / 2)
        .clamp(0, size.x - paddle.size.x)
        .toDouble();
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    // Fare hareketinde paddle'ın hedef konumunu güncelliyoruz.
    final localPosition = info.eventPosition.global;
    paddleTargetX = (localPosition.x - paddle.size.x / 2)
        .clamp(0, size.x - paddle.size.x)
        .toDouble();
  }
}
