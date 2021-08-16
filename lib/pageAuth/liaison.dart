import 'package:flutter/material.dart';
import 'package:online_contacts/pageAuth/connexion.dart';
import 'package:online_contacts/pageAuth/inscription.dart';

class LiaisonPageAuth extends StatefulWidget {
  @override
  _LiaisonPageAuthState createState() => _LiaisonPageAuthState();
}

class _LiaisonPageAuthState extends State<LiaisonPageAuth> {

  bool affichePageConnexion = true;

  void basculer(){
    setState(() {
      affichePageConnexion = !affichePageConnexion;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(affichePageConnexion){
      return Connexion(basculer: basculer);
    }else{
      return Inscription(basculer: basculer);
    }
  }
}
