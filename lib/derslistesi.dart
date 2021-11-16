import 'package:flutter/material.dart';
import 'package:nothesaplama/sabitler.dart';
import 'data_helper.dart';

class DersListesi extends StatelessWidget {
  final Function ondismiss;
  const DersListesi({required this.ondismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Help.tumderler.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (gelendeger) {
                  ondismiss(index);
                },
                child: Card(
                  color: Sabitler.anarenk.shade100.withOpacity(0.1),
                  child: ListTile(
                    title: Text(
                      Help.tumderler[index].ad,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "Kredi Değeri : ${Help.tumderler[index].kredidegeri} Hard Değeri : ${Help.tumderler[index].harfdegeri}"),
                    leading: CircleAvatar(
                      child: Text(
                        (Help.tumderler[index].harfdegeri *
                                Help.tumderler[index].kredidegeri)
                            .toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: Help.tumderler.length,
          )
        : Container(
            child: Center(
              child: Text(
                "Lütfen Ders Giriniz",
                style: Sabitler.texturu,
              ),
            ),
          );
  }
}
