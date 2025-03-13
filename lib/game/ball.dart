import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'paddle.dart';
import 'brick.dart';

class Ball extends PositionComponent with CollisionCallbacks, HasGameRef {
  Vector2 velocity;

  Ball({
    required this.velocity,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Normalde hitbox, topun yarıçapı kadar olur; relativeRadius: 0.5, yarıçapın yarısı kadar ayarlar.
    add(CircleHitbox(radius: size.x / 2));
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.red;
    // Topu, verilen size değerine göre çizeriz.
    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x / 2,
      paint,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    final gameSize = gameRef.size;

    // Sol ve sağ duvar kontrolü
    if (position.x < 0) {
      position.x = 0;
      velocity.x = -velocity.x;
    } else if (position.x + size.x > gameSize.x) {
      position.x = gameSize.x - size.x;
      velocity.x = -velocity.x;
    }

    // Üst duvar kontrolü
    if (position.y < 0) {
      position.y = 0;
      velocity.y = -velocity.y;
    }
    // Alt duvara çarptığında topu resetle
    else if (position.y + size.y > gameSize.y) {
      position =
          Vector2(gameSize.x / 2 - size.x / 2, gameSize.y / 2 - size.y / 2);
      velocity = Vector2(200, -200);
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Paddle) {
      velocity.y = -velocity.y;
    } else if (other is Brick) {
      final brickCenter = other.position + other.size / 2;
      final ballCenter = position + size / 2;
      final diff = ballCenter - brickCenter;
      if (diff.x.abs() > diff.y.abs()) {
        velocity.x = -velocity.x;
      } else {
        velocity.y = -velocity.y;
      }
    }
    super.onCollision(intersectionPoints, other);
  }
}
