import 'package:flutter/material.dart';
import 'package:flutter_deneme1/models/soru_models.dart';

import 'secenek_widget.dart';

class DenemePage extends StatefulWidget {
  final List<SoruModel> denemeData;
  DenemePage({this.denemeData});
  @override
  _DenemePageState createState() => _DenemePageState();
}

class _DenemePageState extends State<DenemePage> {
  bool bitti = false;

  yenidenCoz() {
    for (int i = 0; i < widget.denemeData.length; i++) {
      widget.denemeData[i].secilmisCevap = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deneme'),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (bitti) {
                yenidenCoz();
                setState(() {
                  bitti = false;
                });
              } else {
                sonucGoster();
              }
            },
            child: Text(bitti ? "Yeniden Çöz" : "Bitir"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: widget.denemeData.length,
        itemBuilder: (contex, index) {
          return Card(
            color: Colors.blue.shade100,
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 4),
                  child: Text("Soru ${index + 1}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.denemeData[index].soru,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  child: SecenekWidget(
                    secenek: Secenek.A,
                    text: widget.denemeData[index].cevap0,
                    selected:
                        widget.denemeData[index].secilmisCevap == Secenek.A,
                    bittMi: bitti,
                    dogruSecenek:
                        widget.denemeData[index].dogruCevap == Secenek.A,
                    bosMu: widget.denemeData[index].secilmisCevap == null,
                  ),
                  onTap: () {
                    setState(() {
                      if (!bitti)
                        widget.denemeData[index].secilmisCevap = Secenek.A;
                    });
                  },
                ),
                InkWell(
                  child: SecenekWidget(
                      secenek: Secenek.B,
                      text: widget.denemeData[index].cevap1,
                      selected:
                          widget.denemeData[index].secilmisCevap == Secenek.B,
                      bosMu: widget.denemeData[index].secilmisCevap == null,
                      bittMi: bitti,
                      dogruSecenek:
                          widget.denemeData[index].dogruCevap == Secenek.B),
                  onTap: () {
                    setState(() {
                      if (!bitti)
                        widget.denemeData[index].secilmisCevap = Secenek.B;
                    });
                  },
                ),
                InkWell(
                  child: SecenekWidget(
                    secenek: Secenek.C,
                    text: widget.denemeData[index].cevap2,
                    selected:
                        widget.denemeData[index].secilmisCevap == Secenek.C,
                    bittMi: bitti,
                    dogruSecenek:
                        widget.denemeData[index].dogruCevap == Secenek.C,
                    bosMu: widget.denemeData[index].secilmisCevap == null,
                  ),
                  onTap: () {
                    setState(() {
                      if (!bitti)
                        widget.denemeData[index].secilmisCevap = Secenek.C;
                    });
                  },
                ),
                InkWell(
                  child: SecenekWidget(
                    secenek: Secenek.D,
                    text: widget.denemeData[index].cevap3,
                    selected:
                        widget.denemeData[index].secilmisCevap == Secenek.D,
                    bittMi: bitti,
                    dogruSecenek:
                        widget.denemeData[index].dogruCevap == Secenek.D,
                    bosMu: widget.denemeData[index].secilmisCevap == null,
                  ),
                  onTap: () {
                    setState(() {
                      if (!bitti)
                        widget.denemeData[index].secilmisCevap = Secenek.D;
                    });
                  },
                ),
                InkWell(
                  child: SecenekWidget(
                    secenek: Secenek.E,
                    text: widget.denemeData[index].cevap4,
                    selected:
                        widget.denemeData[index].secilmisCevap == Secenek.E,
                    bittMi: bitti,
                    dogruSecenek:
                        widget.denemeData[index].dogruCevap == Secenek.E,
                    bosMu: widget.denemeData[index].secilmisCevap == null,
                  ),
                  onTap: () {
                    setState(() {
                      if (!bitti)
                        widget.denemeData[index].secilmisCevap = Secenek.E;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  sonucGoster() {
    int dogruSayisi = 0;
    int bosSayisi = 0;
    int yanlisSayisi = 0;
    for (int i = 0; i < widget.denemeData.length; i++) {
      if (widget.denemeData[i].secilmisCevap == null) {
        bosSayisi++;
      } else if (widget.denemeData[i].secilmisCevap ==
          widget.denemeData[i].dogruCevap) {
        dogruSayisi++;
      } else {
        yanlisSayisi++;
      }
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Deneme sonucu"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Doğru sayısı  :" + dogruSayisi.toString()),
              Text("Yanlış sayısı :" + yanlisSayisi.toString()),
              Text("Boş sayısı    :" + bosSayisi.toString()),
              Text("Soru sayısı   :" + widget.denemeData.length.toString()),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                yenidenCoz();
                Navigator.of(context).pop();
              },
              child: Text("Yeniden Çöz"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bitti = true;
                });
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}
