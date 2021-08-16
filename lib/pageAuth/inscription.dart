import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
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
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmez le mot de passe",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                FlatButton(
                  onPressed: (){},
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
