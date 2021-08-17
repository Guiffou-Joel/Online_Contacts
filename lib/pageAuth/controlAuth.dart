import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_contacts/pageAuth/liaison.dart';
import 'package:provider/provider.dart';
import 'package:online_contacts/pageCrud/acceuil.dart';


class Utilisateur {
  String idUtil;

  Utilisateur({this.idUtil});
}

class DonneesUtil {
  String email;
  String nomComplet;

  DonneesUtil({this.email, this.nomComplet});
}

class StreamProviderAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Création d'un objet utilisateur provenant de la classe firebase
  Utilisateur _utilisateurDeFirebaseUser(FirebaseUser user){
    return user != null ? Utilisateur(idUtil: user.uid) : null;
  }

  //La difusion de l'auth de l'utilisateur
  Stream<Utilisateur> get utilisateur{
    return _auth.onAuthStateChanged.map(_utilisateurDeFirebaseUser);
  }
}

class Passerelle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final utilisateur = Provider.of<Utilisateur>(context);

    //Si l'utilisateur existe on le dirige a la page d'acceui si non il doit s'authentifier
    if(utilisateur == null){
      return LiaisonPageAuth();
    }else{
      return Acceuil();
    }
  }
}

class GetCurrentuserDate{
  String idutil;
  GetCurrentuserDate({this.idutil});

  //la reference de la collection utilisateur
  final CollectionReference collectionUtil = Firestore.instance.collection("utilisateurs");

  DonneesUtil _donneesUtilDeSnapshot(DocumentSnapshot snapshot){
    return DonneesUtil(
      nomComplet: snapshot['nomComplet'],
      email: snapshot['emailUtil']
    );
  }

  //Optention doc util en stream
  Stream<DonneesUtil> get donneesUtil{
    return collectionUtil.document(idutil).snapshots().map(_donneesUtilDeSnapshot);
  }
}
