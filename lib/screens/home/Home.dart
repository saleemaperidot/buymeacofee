import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseproject/model/brews.dart';
import 'package:firebaseproject/screens/home/brew_list.dart';
import 'package:firebaseproject/screens/home/settings_form.dart';
import 'package:firebaseproject/services/auth.dart';
import 'package:firebaseproject/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    final AuthSerrvices _auth = AuthSerrvices();
    // final DatabaseService databaseService = DatabaseService();
    return StreamProvider<List<Brews>>.value(
      value: DatabaseService().brew,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("crew"),
          backgroundColor: Colors.brown[400],
          actions: [
            IconButton(
                onPressed: () async {
                  print("sign out");
                  final out = _auth.signout();
                  print(out);
                  await _auth.signout();
                },
                tooltip: "logout",
                icon: Icon(Icons.logout)),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
