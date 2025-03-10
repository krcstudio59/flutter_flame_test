import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

class Paddle extends PositionComponent with CollisionCallbacks {
  final double speed = 400; // İstersen klavye kontrolü vs. için kullanabilirsin

  Paddle({
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(size.toRect(), paint);
  }

  void moveLeft(double dt) {
    x -= speed * dt;
  }

  void moveRight(double dt) {
    x += speed * dt;
  }
}
