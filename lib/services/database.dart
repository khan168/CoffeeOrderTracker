import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  //collections reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');
  final String uid;

  DatabaseService({required this.uid});
  //function updates and creates a doc for particular uid
  Future updateUserData(String sugars, String name, int strength ) async{
    return await brewCollection.doc(uid).set({
      'sugars':sugars,
      'name': name,
      'strength':strength
    }

    );
  }
}