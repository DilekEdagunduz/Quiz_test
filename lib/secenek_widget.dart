import 'package:flutter/material.dart';

enum Secenek { A, B, C, D, E }

class SecenekWidget extends StatefulWidget {
  final String text;
  final bool bosMu;
  final bool dogruSecenek;
  final Secenek secenek;
  final bool selected;
  final bool bittMi;
  const SecenekWidget({
    @required this.secenek,
    @required this.text,
    this.selected,
    this.dogruSecenek,
    this.bittMi,
    this.bosMu,
    Key key,
  }) : super(key: key);

  @override
  _SecenekWidgetState createState() => _SecenekWidgetState();
}

class _SecenekWidgetState extends State<SecenekWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        selected: widget.selected,
        selectedTileColor: widget.bittMi
            ? widget.dogruSecenek
                ? Colors.green
                : Colors.red
            : Colors.blue.shade800,
        tileColor: widget.bittMi && !widget.bosMu
            ? widget.dogruSecenek
                ? Colors.green
                : Colors.blue.shade200
            : Colors.blue.shade200,
        leading: Text(widget.secenek.toString().split('.').last),
        title: Text(
          widget.text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
