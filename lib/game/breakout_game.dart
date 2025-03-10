import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'paddle.dart';
import 'ball.dart';
import 'brick.dart';

class BreakoutGame extends FlameGame
    with HasCollisionDetection, PanDetector, MouseMovementDetector {
  late Paddle paddle;
  late Ball ball;

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

    // Top oluşturuluyor
    ball = Ball(
      position: Vector2(size.x / 2, size.y / 2),
      size: Vector2(20, 20),
      velocity: Vector2(200, -200),
    );
    add(ball);

    // Bricks (tuğlalar) oluşturuluyor
    const int rowCount = 5;
    const int colCount = 7;
    final double brickWidth = size.x / colCount;
    const double brickHeight = 20.0;
    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        final brick = Brick(
          position: Vector2(col * brickWidth, row * brickHeight + 50),
          size: Vector2(brickWidth, brickHeight),
        );
        add(brick);
      }
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    final localPosition = info.eventPosition.global;
    paddle.x = localPosition.x - paddle.size.x / 2;
    // Paddle ekran dışına çıkmasın:
    paddle.x = paddle.x.clamp(0, size.x - paddle.size.x);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    final localPosition = info.eventPosition.global;
    paddle.x = localPosition.x - paddle.size.x / 2;
    paddle.x = paddle.x.clamp(0, size.x - paddle.size.x);
  }
}
