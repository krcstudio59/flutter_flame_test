// lib/brick_matrix_loader.dart
import 'package:flutter/services.dart' show rootBundle;

Future<List<List<int>>> loadBrickMatrix() async {
  // Dosyayı assets klasöründen yükle (pubspec.yaml'da tanımlı olduğundan emin olun)
  final String content =
      await rootBundle.loadString('assets/levels/brick_matrix.txt');

  // Dosya içeriğini satırlara ayıralım.
  final lines =
      content.split('\n').where((line) => line.trim().isNotEmpty).toList();

  List<List<int>> matrix = [];

  for (var line in lines) {
    line = line.trim();
    // Eğer satır başında "[" varsa kaldırıyoruz
    if (line.startsWith('[')) {
      line = line.substring(1);
    }
    // Eğer satır sonunda "]," veya "]" varsa kaldırıyoruz
    if (line.endsWith('],')) {
      line = line.substring(0, line.length - 2);
    } else if (line.endsWith(']')) {
      line = line.substring(0, line.length - 1);
    }

    // Elemanları virgülle ayıralım ve integer'a çevirelim.
    final values = line.split(',').map((s) => int.parse(s.trim())).toList();
    matrix.add(values);
  }

  return matrix;
}
