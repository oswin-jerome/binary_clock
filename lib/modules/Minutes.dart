import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './SingleBit.dart';
class Minutes extends StatefulWidget {
  @override
  _MinutesState createState() => _MinutesState();
}

class _MinutesState extends State<Minutes> {
  // String m = "sdsd";
  String h1 ='0';
  String h2 ='0';
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      var _now = DateTime.now();
      // print(_now.second.toString());
      var ti =  _now.minute.toString();
      if(ti.length<2){
        ti='0'+ti;
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
      margin: EdgeInsets.only(bottom: 10,top: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[MinuteOne(h1), MinuteTwo(h2)],
          ),
          Container(
            color: Colors.blue,
            height: 1,
            width: 100,
            margin: EdgeInsets.only(top: 10,bottom: 10),
          ),
          Text(
          h1+h2,
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ],
      ),
    );
  }
}

class MinuteOne extends StatelessWidget {

  String t;
  MinuteOne(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    // print(b[b.length-1]);
    return Column(
      children: <Widget>[
        Text(
          "M",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SingleBit(b[b.length-3],'4',Colors.blue),
        SingleBit(b[b.length-2],'2',Colors.blue),
        SingleBit(b[b.length-1],'1',Colors.blue),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}

class MinuteTwo extends StatelessWidget {
    String t;
    MinuteTwo(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    return Column(
      children: <Widget>[
        Text(
          "M",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SingleBit(b[b.length-4],'8',Colors.blue),
        SingleBit(b[b.length-3],'4',Colors.blue),
        SingleBit(b[b.length-2],'2',Colors.blue),
        SingleBit(b[b.length-1],'1',Colors.blue),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
