import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spare_ease/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel {
    return userModel;
  }

  Future<UserModel?> fetchUserInfo() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return null;
    }
    String userId = user.uid;
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection("user").doc(userId).get();

      final userDocDict = userDoc.data();
      userModel = UserModel(
        userId: userDoc.get("userId"),
        firstName: userDoc.get("firstName"),
        lastName: userDoc.get("lastName"),
        address: userDoc.get("address"),
        email: userDoc.get('email'),
        password: userDoc.get('password'),
        contactNumber: userDoc.get('contactNumber'),
        userCart:
            userDocDict!.containsKey("userCart") ? userDoc.get("userCart") : [],
        createdAt: userDoc.get('createdAt'),
      );
      return userModel;
    } on FirebaseException catch (error) {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
