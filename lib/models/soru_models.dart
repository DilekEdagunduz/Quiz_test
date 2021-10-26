import 'package:flutter/cupertino.dart';
import 'package:flutter_deneme1/secenek_widget.dart';

class SoruModel {
  String resimUrl;
  String aciklama;
  String soru;
  Secenek dogruCevap;
  String cevap0;
  String cevap1;
  String cevap2;
  String cevap3;
  String cevap4;
  Secenek secilmisCevap;

  SoruModel({
    this.resimUrl,
    this.aciklama,
    @required this.cevap0,
    @required this.cevap1,
    @required this.cevap2,
    @required this.cevap3,
    @required this.cevap4,
    @required this.soru,
    @required this.dogruCevap,
  });

 
}
