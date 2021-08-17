import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
class Chargement extends StatefulWidget {
  @override
  _ChargementState createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 100.0),
        child: Column(
          children: <Widget>[
            Image.asset("assets/logo.png", height: 200.0, width: 200.0,),
            SizedBox(height: 10.0 ),
            SpinKitChasingDots(
              color: Colors.amber,
              size: 50.0
            ),
          ],
        ),
      )
    );
  }
}
