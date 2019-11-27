import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './modules/Hour.dart';
import './modules/Minutes.dart';
import './modules/Seconds.dart';
void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Container(
            color: Color(0xff333333),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hour(),
                SizedBox(width: 20,),
                Minutes(),
                SizedBox(width: 20,),
                Seconds(),
                SizedBox(width: 50,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Binary Clock",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text("By Oswin Jerome",style: TextStyle(color: Colors.deepPurpleAccent,fontStyle: FontStyle.italic,fontSize: 18),textAlign: TextAlign.center,),
                  ],
                )
                // Hour(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}