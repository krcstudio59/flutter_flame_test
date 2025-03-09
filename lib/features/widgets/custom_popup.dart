import 'dart:io';
import 'package:flutter/material.dart';

void showExitConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Çıkış Yap"),
        content: const Text("Çıkmak istediğinizden emin misiniz?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Pop-up'ı kapat
            },
            child: const Text("İptal"),
          ),
          TextButton(
            onPressed: () {
              exit(0); // Uygulamayı kapat
            },
            child: const Text("Evet"),
          ),
        ],
      );
    },
  );
}
