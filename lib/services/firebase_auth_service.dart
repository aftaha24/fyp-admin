import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'local_shared_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String result = '';

    // to avoid spaces
    email.trim();
    password.trim();

    try {
      var userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCred.user != null) {
        var adminDoc = await FirebaseFirestore.instance
            .collection('admin')
            .doc(userCred.user!.uid)
            .get();
        if (adminDoc.exists) {
          LocalService().setSharedToken(userCred.user!.uid);
          result = 'success';
        } else {
          result = 'invalid admin credentails';
        }
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      result = e.message.toString();
    }

    return result;
  }
}
