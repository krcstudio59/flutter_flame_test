import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flame/game.dart';
import 'package:flutter_flame_engine/main.dart';

void main() {
  testWidgets('Flame game widget loads correctly', (WidgetTester tester) async {
    // Oyun widget'ını oluştur
    await tester.pumpWidget(MaterialApp(home: GameWidget(game: MyGame())));

    // Oyun widget'ının ekranda olup olmadığını kontrol et
    expect(find.byType(GameWidget), findsOneWidget);
  });
}
