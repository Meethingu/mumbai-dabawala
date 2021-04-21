import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference mumbaiDabawala =
      FirebaseFirestore.instance.collection("your collection");

  Future updateUserData(String names, String pickupaddress,
      String deliveryaddress, String pancardnumber) async {
    return await mumbaiDabawala.doc(uid).set({
      'names': names,
      'pickupaddress': pickupaddress,
      'deliveryaddress': deliveryaddress,
      'pancardnumber': pancardnumber,
    });
  }
}
