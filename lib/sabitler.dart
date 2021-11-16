import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anarenk = Colors.indigo;

  static const String baslik = "Ortalama Hesapla";
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static final TextStyle texturu = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anarenk,
  );
  static final TextStyle dersayisitexturu = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anarenk,
  );
  static final TextStyle ortalamatexturu = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: anarenk,
  );
  static final dropdownpadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static final yataypadding8 = EdgeInsets.symmetric(horizontal: 8);
}
