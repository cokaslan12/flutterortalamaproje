import 'package:flutter/material.dart';

import 'ders.dart';

class Help {
  static List<Ders> tumderler = [];
  static dersEkle(Ders ders) {
    tumderler.add(ders);
  }

  static ortalamahesaplama() {
    double toplamNot=0;
    double toplamKredi=0;
    tumderler.forEach((element) {
      toplamNot = toplamNot + (element.harfdegeri * element.kredidegeri);
      toplamKredi += element.kredidegeri;
    });
    return toplamNot / toplamKredi;
  }

  static List<String> tumderlerinharfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static List<int> tumkrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static double _harfiotacevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumderlerinharflericevir() {
    return tumderlerinharfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiotacevir(e),
            ))
        .toList();
  }

  static List<DropdownMenuItem<double>> krediler() {
    return tumkrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
