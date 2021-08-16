import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String nomComplet = "";
  String email = "";
  String motDePass = "";
  String confirmMdP = "";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                      //TODO: Appliquer la logique
                    }
                  },
                  color: Colors.amber,
                  child: Text("S'inscrire"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                OutlineButton(
                  onPressed: (){},
                  borderSide: BorderSide(width: 1.0, color: Colors.black,),
                  child: Text("Besoin d'un nouveau compte"),
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
