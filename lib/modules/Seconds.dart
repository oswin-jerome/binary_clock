import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './SingleBit.dart';

class Seconds extends StatefulWidget {
  @override
  _SecondsState createState() => _SecondsState();
}

class _SecondsState extends State<Seconds> {
  String h1 = '0';
  String h2 = '0';
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      var _now = DateTime.now();
      var ti = _now.second.toString();
      if (ti.length < 2) {
        ti = '0' + ti;
      }

      // print(ti);
      setState(() {
        h1 = ti[0];
        h2 = ti[1];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[SecondsOne(h1), SecondsTwo(h2)],
          ),
          Container(
            color: Colors.orange,
            height: 1,
            width: 100,
            margin: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Text(
            h1 + h2,
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class SecondsOne extends StatelessWidget {
  String t;
  SecondsOne(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    return Column(
      children: <Widget>[
        Text(
          "S",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SingleBit(b[b.length - 3], '4', Colors.orange),
        SingleBit(b[b.length - 2], '2', Colors.orange),
        SingleBit(b[b.length - 1], '1', Colors.orange),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}

class SecondsTwo extends StatelessWidget {
  String t;
  SecondsTwo(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    return Column(
      children: <Widget>[
        Text(
          "S",
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SingleBit(b[b.length - 4], '8', Colors.orange),
        SingleBit(b[b.length - 3], '4', Colors.orange),
        SingleBit(b[b.length - 2], '2', Colors.orange),
        SingleBit(b[b.length - 1], '1', Colors.orange),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
