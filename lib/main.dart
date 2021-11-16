import 'package:flutter/material.dart';
import 'package:nothesaplama/sabitler.dart';
import 'ortalamahesapla.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Not hesaplama",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Sabitler.anarenk,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ortalamahesapla());
  }
}
