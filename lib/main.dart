import 'package:flutter/material.dart';
import 'package:online_contacts/pageAuth/liaison.dart';

void main() => runApp(MonApp());

class MonApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LiaisonPageAuth(),
    );
  }
}
