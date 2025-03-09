import 'package:flutter/material.dart';
import 'package:flutter_flame_test/features/widgets/custom_button.dart';
import 'game_view.dart'; // Oyuna geçiş için
import '../widgets/custom_popup.dart'; // Çıkış onay pop-up'ı için

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Arka plan rengi
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              text: "OYNA",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              },
            ),
            MenuButton(
              text: "YÜKSEK SKOR",
              onPressed: () {
                // Buraya yüksek skor ekranına geçiş eklenebilir
              },
            ),
            MenuButton(
              text: "BAŞARILAR",
              onPressed: () {
                // Buraya başarılar ekranına geçiş eklenebilir
              },
            ),
            MenuButton(
              text: "AYARLAR",
              onPressed: () {
                // Buraya ayarlar ekranına geçiş eklenebilir
              },
            ),
            MenuButton(
              text: "ÇIKIŞ",
              onPressed: () {
                showExitConfirmationDialog(context); // Çıkış pop-up'ını göster
              },
            ),
          ],
        ),
      ),
    );
  }
}
