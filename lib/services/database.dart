import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseproject/model/brews.dart';
import 'package:firebaseproject/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid = ""});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");

  Future UpdateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'stregth': strength});
  }

  //brew list from snapshort

  List<Brews> brewListFromSnapShort(QuerySnapshot snapshort) {
    return snapshort.docs.map((e) {
      return Brews(
        name: e.get("name"),
        sugars: e.get("sugars"),
        stregth: e.get("stregth"),
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.get("name"),
        sugars: snapshot.get("sugars"),
        strength: snapshot.get("stregth"));
  }
  //get brews stream

// get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<List<Brews>> get brew {
    return brewCollection.snapshots().map(brewListFromSnapShort);
  }
}

 // user data from snapshots
  
