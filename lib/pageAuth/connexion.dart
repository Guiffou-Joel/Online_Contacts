import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_contacts/constants/chargement.dart';

class Connexion extends StatefulWidget {

  final Function basculer;
  Connexion({this.basculer});
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = "";
  String motDePass = "";

  bool chargement = false;

  final _keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return chargement ? Chargement() : Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _keyform,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/logo.png", height: 100.0, width: 100.0,),
                Center(
                  child: Text(
                    "Bienvenue sur Online Contacts",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.isEmpty ? "Entrez une adresse email" : null,
                  onChanged: (val) => email = val,
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.length < 6 ? "Mot de passe incorrect" : null,
                  onChanged: (val) => motDePass = val,
                ),
                SizedBox(height: 10.0,),
                FlatButton(
                  onPressed: () async {
                    if(_keyform.currentState.validate()){
                      setState(() {
                        chargement = true;
                      });
                      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: motDePass);
                      if(result == null){
                        //TODO: error
                      }
                    }
                  },
                  color: Colors.amber,
                  child: Text("Connexion"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                SizedBox(height: 10.0,),
                OutlineButton(
                  onPressed: (){
                    widget.basculer();
                  },
                  borderSide: BorderSide(width: 1.0, color: Colors.amber),
                  child: Text("Besoin d'un nouveau compte ?"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
