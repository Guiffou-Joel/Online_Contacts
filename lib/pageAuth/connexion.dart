import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  String email = "";
  String motDePass = "";

  final _keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: (){
                    if(_keyform.currentState.validate()){
                    //TODO: ajouter la logique
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
                  onPressed: (){},
                  borderSide: BorderSide(width: 1.0, color: Colors.amber),
                  child: Text("Avez-vous deja un compte ?"),
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
