import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hive_model.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<HiveModel>> fetchHives() {
    return _firestore.collection('hives').snapshots().map((event) {
      List<HiveModel> hives = [];

      for (var element in event.docs) {
        hives.add(HiveModel.fromMap(element.data()));
      }

      return hives;
    });
  }

  Stream<List<HiveModel>> fetchParticalHives(String uid) {
    return _firestore
        .collection('hives')
        .where('userID', isEqualTo: uid)
        .snapshots()
        .map((event) {
      List<HiveModel> hives = [];

      for (var element in event.docs) {
        hives.add(HiveModel.fromMap(element.data()));
      }

      return hives;
    });
  }
}
