import 'package:flutter/material.dart';
import 'package:nothesaplama/sabitler.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int derssayisi;
  const OrtalamaGoster(
      {required this.derssayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          derssayisi > 0 ? "$derssayisi  Ders Girildi" : "Ders Giriniz",
          style: Sabitler.dersayisitexturu,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamatexturu,
        ),
        Text(
          "Ortalama",
          style: Sabitler.dersayisitexturu,
        ),
      ],
    );
  }
}
