import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traceebee_admin_app/models/user_model.dart';
import 'package:traceebee_admin_app/utlis/extensions.dart';

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

  Stream<List<UserModel>> fetchUsers() {
    return _firestore.collection('users').snapshots().map((event) {
      List<UserModel> users = [];
      for (var user in event.docs) {
        users.add(UserModel.fromMap(user.data()));
      }

      return users;
    });
  }

  Future<Map<String, List<HiveModel>>> fetch() async {
    var res = await _firestore.collection('hives').get();

    List<HiveModel> hives = [];
    Map<String, List<HiveModel>> filteredHives = {};

    for (var element in res.docs) {
      hives.add(HiveModel.fromMap(element.data()));
    }

    for (var element in hives) {
      filteredHives = hives.groupingBy(element.userID!);
      // log(hives.groupingBy(element.userID!).toString());
    }

    log(filteredHives.toString());

    return filteredHives;
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
