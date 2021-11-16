import 'package:flutter/material.dart';
import 'package:nothesaplama/ders.dart';
import 'package:nothesaplama/derslistesi.dart';
import 'package:nothesaplama/ortalamagoster.dart';
import 'package:nothesaplama/sabitler.dart';
import 'data_helper.dart';

class ortalamahesapla extends StatefulWidget {
  const ortalamahesapla({Key? key}) : super(key: key);

  @override
  _ortalamahesaplaState createState() => _ortalamahesaplaState();
}

class _ortalamahesaplaState extends State<ortalamahesapla> {
  var formnkey = GlobalKey<FormState>();
  double secilendeger = 4;
  double secilenkredi = 1;
  String girilendersadi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Sabitler.baslik,
          style: Sabitler.texturu,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //form
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildform(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      derssayisi: Help.tumderler.length,
                      ortalama: Help.ortalamahesaplama()),
                ),
              ],
            ),
          ),
          Expanded(
            child: DersListesi(
              ondismiss: (index) {
                Help.tumderler.removeAt(index);
                setState(() {});
              },
            ),
          ),
          //liste
        ],
      ),
    );
  }

  Widget _buildform() {
    return Form(
      key: formnkey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yataypadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yataypadding8,
                  child: _buildharfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yataypadding8,
                  child: _buildkrediler(),
                ),
              ),
              IconButton(
                onPressed: _dersekleveortalamahesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anarenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilendersadi = deger!;
        });
      },
      validator: (deger) {
        if (deger!.length <= 0) {
          return "Ders Adı Giriniz";
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Sabitler.anarenk.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildharfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownpadding,
      decoration: BoxDecoration(
        color: Sabitler.anarenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anarenk.shade200,
        underline: Container(),
        value: secilendeger,
        onChanged: (deger) {
          setState(() {
            secilendeger = deger!;
          });
        },
        items: Help.tumderlerinharflericevir(),
      ),
    );
  }

  _buildkrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownpadding,
      decoration: BoxDecoration(
        color: Sabitler.anarenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenkredi,
        onChanged: (deger) {
          secilenkredi = deger!;
        },
        elevation: 16,
        underline: Container(),
        iconEnabledColor: Sabitler.anarenk.shade200,
        items: Help.krediler(),
      ),
    );
  }

  void _dersekleveortalamahesapla() {
    if (formnkey.currentState!.validate()) {
      formnkey.currentState!.save();
      Help.dersEkle(Ders(
        ad: girilendersadi,
        harfdegeri: secilendeger,
        kredidegeri: secilenkredi,
      ));
      setState(() {});
    }
  }
}
