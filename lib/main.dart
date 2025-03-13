import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'game/breakout_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 820),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GameWidget(
            game: BreakoutGame(),
          );
        });
  }
}
