import 'package:flutter/material.dart';
import 'package:online_contacts/pageAuth/controlAuth.dart';
import 'package:online_contacts/pageAuth/liaison.dart';
import 'package:provider/provider.dart';

void main() => runApp(MonApp());

class MonApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Utilisateur>.value(
      value: StreamProviderAuth().utilisateur,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Passerelle()
      ),
    );
  }
}
