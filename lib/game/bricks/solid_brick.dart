import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../ball.dart';

class SolidBrick extends PositionComponent with CollisionCallbacks {
  SolidBrick({
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
    final paint = Paint()..color = Colors.black;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Ball) {
      final brickCenter = position + size / 2;
      final ballCenter = other.position + other.size / 2;
      final diff = ballCenter - brickCenter;
      if (diff.x.abs() > diff.y.abs()) {
        other.velocity.x = -other.velocity.x;
      } else {
        other.velocity.y = -other.velocity.y;
      }
    }
    super.onCollision(intersectionPoints, other);
  }
}
