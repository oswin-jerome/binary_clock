import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './SingleBit.dart';
class Hour extends StatefulWidget {
  @override
  _HourState createState() => _HourState();
}

class _HourState extends State<Hour> {
  // String m = "sdsd";
  String h1 ='0';
  String h2 ='0';
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      var _now = DateTime.now();
      // Get Hour
      var ti =  _now.hour.toString();

      // if length is less than 1 add 0 to left
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
            children: <Widget>[HourOne(h1), HourTwo(h2)],
          ),
          Container(
            color: Colors.green,
            height: 1,
            width: 100,
            margin: EdgeInsets.only(top: 10,bottom: 10),
          ),
          Text(
          h1+h2,
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ],
      ),
    );
  }
}

class HourOne extends StatelessWidget {

  String t;
  HourOne(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    // print(b[b.length-1]);
    return Column(
      children: <Widget>[
        Text(
          "H",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SingleBit(b[b.length-2],'2',Colors.green),
        SingleBit(b[b.length-1],'1',Colors.green),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}

class HourTwo extends StatelessWidget {
    String t;
    HourTwo(this.t);
  @override
  Widget build(BuildContext context) {
    var b = t.codeUnitAt(0).toRadixString(2);
    return Column(
      children: <Widget>[
        Text(
          "H",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SingleBit(b[b.length-4],'8',Colors.green),
        SingleBit(b[b.length-3],'4',Colors.green),
        SingleBit(b[b.length-2],'2',Colors.green),
        SingleBit(b[b.length-1],'1',Colors.green),
        Text(
          b.substring(2),
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
