import 'package:flutter/material.dart';

class SingleBit extends StatelessWidget {
  String t;
  String bitplace;
  Color col;
  SingleBit(this.t, this.bitplace, this.col);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      decoration: BoxDecoration(
        color: t == '0' ? Color(0xff4D4D4D) : col,
        borderRadius: BorderRadius.circular(5),
      ),
      duration: Duration(milliseconds: 300),
      child: Container(
        child: SizedBox(
          height: 44,
          width: 31,
          child: Center(
            child: Text(
              t == '0' ? '' : bitplace,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
