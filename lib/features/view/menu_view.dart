import 'dart:io';

import 'package:flutter/material.dart';
import 'game_view.dart'; // Oyuna geçiş için

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
                // Uygulamayı kapat
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MenuButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
