import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'ball.dart';

class Brick extends PositionComponent with CollisionCallbacks {
  bool isDestroyed = false;

  Brick({
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
    final paint = Paint()
      ..color = isDestroyed ? Colors.transparent : Colors.green;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // Top çarpınca kendini yok et
    if (other is Ball) {
      isDestroyed = true;
      removeFromParent(); // Sahneden bileşeni tamamen kaldır
    }
    super.onCollision(intersectionPoints, other);
  }
}
