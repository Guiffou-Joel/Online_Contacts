import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Inscription extends StatefulWidget {

  final Function basculer;
  Inscription({this.basculer});
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser courentUtil;

  //collection Utilisateur depuis firestore
  final CollectionReference collectionUtil = Firestore.instance.collection("utilisateurs");

  String nomComplet = "";
  String email = "";
  String motDePass = "";
  String confirmMdP = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance.currentUser().then((FirebaseUser util){
      setState(() {
        this.courentUtil = util;
      });
    });

    String _idUtil(){
      if(courentUtil != null){
        return courentUtil.uid;
      }else{
        return "pas d'utilisateur courant";
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/logo.png", height: 100.0, width: 100.0,),
                Center(
                  child: Text(
                    "Créer un compte Online Contacts",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nom complet",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.isEmpty ? "Entrez un nom" : null,
                  onChanged: (val) => nomComplet = val,
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.isEmpty ? "Entrez un email" : null,
                  onChanged: (val) => email = val,
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? "Entrez un mot de passe de 6 caracteres ou plus" : null,
                  onChanged: (val) => motDePass = val,
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmez le mot de passe",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (val) => confirmMdP != motDePass ? "La confirmation de mot de passe ne correspond pas" : null,
                  onChanged: (val) => confirmMdP = val,
                ),
                FlatButton(
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: motDePass);

                      await collectionUtil.document(_idUtil()).setData({
                        'idUtil' : _idUtil,
                        'nomComplet' : nomComplet,
                        'emailUtil' : email
                      });

                      if(result == null){
                        //TODO: //erreor
                      }
                    }
                  },
                  color: Colors.amber,
                  child: Text("S'inscrire"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                OutlineButton(
                  onPressed: (){
                    widget.basculer();
                  },
                  borderSide: BorderSide(width: 1.0, color: Colors.black,),
                  child: Text("Avez-vous deja un compte ?"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
